import streamlit as st

# List of airline codes based on provided data
airline_codes = ["AA", "AS", "B6", "DL", "EV", "F9", "G4", "HA", "MQ", "NK", "OH", "OO", "QX", "UA", "WN", "YV", "YX"]

# List of origin and destination airport codes based on provided data
origin_codes = ["ABI", "ABQ", "ABR", "ABY", "ACK", "ACT", "ACV", "ACY", "ADK", "ADQ", "AEX", "AGS", "AKN", "ALB", 
                "ALO", "ALS", "ALW", "AMA", "ANC", "APN", "ART", "ASE", "ATL", "ATW", "ATY", "AUS", "AVL", "AVP", 
                "AZA", "AZO", "BDL", "BET", "BFF", "BFL", "BFM", "BGM", "BGR", "BHM", "BIH", "BIL", "BIS", "BJI", 
                "BKG", "BLI", "BLV", "BMI", "BNA", "BOI", "BOS", "BPT", "BQK", "BQN", "BRD", "BRO", "BRW", "BTM", 
                "BTR", "BTV", "BUF", "BUR", "BWI", "BZN"]

dest_codes = origin_codes  # Assuming destination codes are the same as origin codes

# Placeholder function to simulate predictions
def predict_delay(departure_code, arrival_code, airline_code, month):
    return f"Estimated delay for {airline_code} from {departure_code} to {arrival_code} in month {month} is 10 minutes."

# Streamlit UI
st.title("Flight Delay Predictor")

# Dropdown menus
departure_code = st.selectbox("Departure Code", origin_codes)
arrival_code = st.selectbox("Arrival Code", dest_codes)
airline_code = st.selectbox("Airline Code", airline_codes)
month = st.number_input("Month", min_value=1, max_value=12, step=1)

if st.button("Predict Delay"):
    result = predict_delay(departure_code, arrival_code, airline_code, month)
    st.write(result)
