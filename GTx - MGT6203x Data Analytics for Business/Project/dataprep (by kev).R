
# Load library ------------------------------------------------------------
library(tidyverse)
library(lubridate)


# Import data -------------------------------------------------------------
oscar <- read.csv(paste0(getwd(),"/Data/oscar.csv")) %>%
    select(-X) %>%
    mutate(name = tolower(Film))
movies <- openxlsx::read.xlsx(paste0(getwd(),"/Data/Movie Scrape All.xlsx"),
                              detectDates = T) %>%
    select(-X1) %>%
    filter(!str_detect(Duration,"TV")) %>%
    mutate(name= tolower(Title),
           year = year(ymd(Release)))

# Joining Oscars list to Movies -------------------------------------------
# We first combine those that we can easily combine with Oscar list
names_in_both <- oscar$name[oscar$name %in% movies$name]
only_1_in_oscars <- oscar %>%
    filter(name %in% names_in_both) %>%
    group_by(name) %>%
    filter(n()==1)

movies1 <- movies %>%
    left_join(only_1_in_oscars, by=c("name"="name")) %>%
    filter(!is.na(Award))

# Joining movies names that has multiple entries in Oscar list (different years)
many_in_oscars <- oscar %>%
    filter(name %in% names_in_both) %>%
    group_by(name) %>%
    filter(n()>1)

movies2 <- movies %>%
    anti_join(movies1) %>%
    left_join(many_in_oscars, by=c("name"="name","year"="Year")) %>%
    filter(!is.na(Award)) %>%
    mutate(Year = year)

movies2 <- rbind(movies1,movies2)

# Remove punctuation to see if any matches
movies_left <- movies %>%
    anti_join(movies2) %>%
    mutate(nopunc=str_replace_all(name, "[[:punct:]]", "")  )

oscar_left <- oscar %>%
    anti_join(movies2)%>%
    mutate(name=str_remove(name,"&amp;")) %>% #remove html &
    mutate(nopunc=str_replace_all(name, "[[:punct:]]", "")  ) %>%
    filter(name != "little women") #movie of these years not in movie list

common_no_punc <- oscar_left$nopunc[oscar_left$nopunc %in% movies_left$nopunc]
movies3 <- movies_left %>%
    left_join(oscar_left %>%
                  select(-name),
              by="nopunc") %>%
    filter(!is.na(Award)) %>%
    select(-nopunc)

movies3 <- rbind(movies2, movies3)

# Remove punctuation to see if any matches
movies_left <- movies %>%
    anti_join(movies3)

oscar_left <- oscar %>%
    anti_join(movies3 %>%
                  select(-name))%>%
    filter(name != "little women") #movie of these years not in movie list


# clean movies3 ----------------------------------------------------------
# remove those with NA values
movies3_cleaned <- movies3 %>%
    filter(!is.na(Budget),
           !is.na(Worldwide),
           !is.na(Release),
           !is.na(Duration),
           !is.na(MPAA.Rating),
           !is.na(Genre))%>%
    filter(grepl("\\d", Release),
           grepl("\\d", Duration))

#clean release date and duration
movies3_cleaned <- movies3_cleaned %>%
    # select(Release,Duration) %>%
    mutate(Release = ymd(Release),
           Duration = case_when(
               str_detect(Duration,"m") & str_detect(Duration,"h")  ~ hm(Duration) %>% as.numeric()/60,
               str_detect(Duration,"h") ~ str_extract(Duration, "\\d+") %>% as.numeric()*60,
               TRUE ~ str_extract(Duration, "\\d+") %>% as.numeric())) %>%
    filter(!is.na(Release),
           !is.na(Duration))

# clean movies_left -------------------------------------------------------
# remove those with NA values
movies_left_cleaned <- movies_left %>%
    filter(!is.na(Budget),
           !is.na(Worldwide),
           !is.na(Release),
           !is.na(Domestic),
           !is.na(Duration),
           !is.na(MPAA.Rating),
           !is.na(Genre))%>%
    filter(grepl("\\d", Release),
           grepl("\\d", Duration))

movies_left_cleaned <- movies_left_cleaned %>%
    filter(!str_detect(Duration,'PG')) %>%
    # select(Release,Duration) %>%
    mutate(Release = ymd(Release),
           Duration = case_when(
               str_detect(Duration,"m") & str_detect(Duration,"h")  ~ hm(Duration) %>% as.numeric()/60,
               str_detect(Duration,"h") ~ str_extract(Duration, "\\d+") %>% as.numeric()*60,
               TRUE ~ str_extract(Duration, "\\d+") %>% as.numeric())) %>%
    filter(!is.na(Release),
           !is.na(Duration)) %>%
    mutate(Award =0,
           Nomination =0)



# Import second webscrape -------------------------------------------------
oscar_scraped <- openxlsx::read.xlsx(paste0(getwd(),"/Data/oscar_final.xlsx"),
                              detectDates = T) %>%
    # select(-X1) %>%
    filter(!str_detect(Duration,"TV")) %>%
    # mutate(name= tolower(Title),
    #        year = year(ymd(Release))) %>%
    {.}

# remove those with NA values
oscar_scraped_filled <- oscar_scraped %>%
    filter(!is.na(Budget),
           !is.na(Worldwide),
           !is.na(Release),
           !is.na(Domestic),
           !is.na(Duration),
           !is.na(MPAA.Rating),
           !is.na(Genre))%>%
    filter(grepl("\\d", Release),
           grepl("\\d", Duration))

# Clean release date
oscar_date <- oscar_scraped_filled %>%
    select(Release) %>%
    mutate(format1 = str_extract(Release, "(.*?)\\s*(?=\\(|\\[)") %>%
               str_remove_all(",")) %>%
    mutate(format1 = case_when(
        str_detect(format1, "\\d{1,2} \\w+ \\d{4}") ~ dmy(format1),
        TRUE ~ mdy(format1))) %>%
    mutate(format2 = if_else(is.na(format1),ymd(Release),NA))

oscar_scraped_filled$Release <- coalesce(oscar_date$format1,
                                         oscar_date$format2)

oscar_scraped_filled$Year <- year(oscar_scraped_filled$Release)

oscar_scraped_filled <- oscar_scraped_filled %>%
    filter(!is.na(Release))

# Clean Budget
oscar_budget <- oscar_scraped_filled %>%
    select(Budget, Year) %>%
    mutate(dollar_sign = if_else(str_detect(Budget,"\\$"),Budget,"")) %>%
    mutate(other_sign = if_else(str_detect(Budget,"\\$"),"",Budget))

oscar_dollar_sign <- oscar_budget %>%
    mutate(value = str_extract(dollar_sign, "(?<=\\$).+") %>% #get value after $
               str_extract("\\d+[^\\s\\[–)]*") %>% #remove values after " ",[,-,)
               str_remove_all(",")) %>% # remove commas
    mutate(numeric = if_else(str_detect(dollar_sign,"million") & as.numeric(value) <1000000,
                             as.numeric(value)*1000000,
                             as.numeric(value)))


oscar_other_sign <- oscar_budget %>%
    select(other_sign, Year) %>%
    mutate(value = str_extract(other_sign,"\\d+[^\\s\\[–)]*") %>% #remove values after " ",[,-,)
               str_remove_all(","), # remove commas
           currency = case_when(str_detect(other_sign,"₹") ~ "INR",
                                str_detect(other_sign,"€") ~ "EUR",
                                str_detect(other_sign,"£") ~ "GBP",
                                TRUE ~ "USD")) %>%
    mutate(numeric = case_when(str_detect(other_sign,"million") & as.numeric(value) <1000000 ~ as.numeric(value)*1000000,
                               str_detect(other_sign,"crore") & as.numeric(value) <10000000 ~ as.numeric(value)*10000000,
                               TRUE ~ as.numeric(value))) %>%
    mutate(converted = NA)

# Convert currency
library(priceR)
for (i in which(!is.na(oscar_other_sign$numeric))) {
    if (oscar_other_sign$Year[i]<2000) {
        y = 2000
    }else{
        y = oscar_other_sign$Year[i]
    }
    oscar_other_sign$converted[i] <-
        historical_exchange_rates(oscar_other_sign$currency[i], to = "USD",
                                  start_date = paste0(y,"-01-01"),
                                  end_date = paste0(y,"-01-01"))[2] %>%
        as.numeric()*oscar_other_sign$numeric[i]

}

oscar_scraped_filled$Budget <- coalesce(oscar_dollar_sign$numeric,
                                        oscar_other_sign$numeric)

oscar_scraped_filled <- oscar_scraped_filled %>%
    mutate(Duration = case_when(
               str_detect(Duration,"m") & str_detect(Duration,"h")  ~ hm(Duration) %>% as.numeric()/60,
               str_detect(Duration,"h") ~ str_extract(Duration, "\\d+") %>% as.numeric()*60,
               TRUE ~ str_extract(Duration, "\\d+") %>% as.numeric())) %>%
    filter(!is.na(Release),
           !is.na(Duration))


# combine all movies3_cleaned, movies_left_cleaned, oscar_scraped_ --------
all_df <- rbind(
    movies_left_cleaned %>%
        select(Title,
               Budget,
               Worldwide,
               Release,
               Duration,
               MPAA.Rating,
               Genre,
               Award,
               Nomination),
    movies3_cleaned %>%
        select(Title,
               Budget,
               Worldwide,
               Release,
               Duration,
               MPAA.Rating,
               Genre,
               Award,
               Nomination),
    oscar_scraped_filled %>%
        select(Title = Film,
               Budget,
               Worldwide,
               Release,
               Duration,
               MPAA.Rating,
               Genre,
               Award,
               Nomination)
) %>%
    filter(!str_detect(MPAA.Rating,"20"),
           !str_detect(MPAA.Rating,"19")) %>%
    mutate(MPAA.Category =
               case_when(
                   MPAA.Rating %in% c('Passed',"Approved","G","GP","PG","TV-G","TV-PG",'TV-Y7') ~ "PG",
                   MPAA.Rating %in% c("M","M/PG",'NC-17','PG-13','TV-14','TV-MA') ~ 'TV-MA',
                   MPAA.Rating %in% c('R','X') ~ 'X',
                   TRUE~ "Unrated"))

write.csv(all_df,"cleaned.csv")
