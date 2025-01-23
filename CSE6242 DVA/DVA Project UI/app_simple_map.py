import streamlit as st
import pydeck as pdk

# Sample latitude and longitude coordinates for airport codes (expand this dictionary with actual coordinates)
airport_coordinates = {
    "ATL": {"lat": 33.6407, "lon": -84.4277},  # Atlanta
    "LAX": {"lat": 33.9416, "lon": -118.4085}, # Los Angeles
    "ORD": {"lat": 41.9742, "lon": -87.9073},  # Chicago O'Hare
    "DFW": {"lat": 32.8998, "lon": -97.0403},  # Dallas/Fort Worth
    "JFK": {"lat": 40.6413, "lon": -73.7781},  # New York JFK
    # Add more coordinates for other airport codes as needed
}

# List of airline codes and airport codes as before
airline_codes = ["AA", "AS", "B6", "DL", "EV", "F9", "G4", "HA", "MQ", "NK", "OH", "OO", "QX", "UA", "WN", "YV", "YX"]
origin_codes = list(airport_coordinates.keys())
dest_codes = origin_codes

# Placeholder function to simulate predictions
def predict_delay(departure_code, arrival_code, airline_code, month):
    return f"Estimated delay for {airline_code} from {departure_code} to {arrival_code} in month {month} is 10 minutes."

# Streamlit UI
st.title("Flight Delay Predictor with Map Visualization")

# Dropdown menus
departure_code = st.selectbox("Departure Code", origin_codes)
arrival_code = st.selectbox("Arrival Code", dest_codes)
airline_code = st.selectbox("Airline Code", airline_codes)
month = st.number_input("Month", min_value=1, max_value=12, step=1)

if st.button("Predict Delay"):
    result = predict_delay(departure_code, arrival_code, airline_code, month)
    st.write(result)

    # Check if selected codes have coordinates
    if departure_code in airport_coordinates and arrival_code in airport_coordinates:
        # Retrieve coordinates for departure and arrival locations
        departure_coords = airport_coordinates[departure_code]
        arrival_coords = airport_coordinates[arrival_code]

        # Data for map visualization
        data = [
            {"name": departure_code, "lat": departure_coords["lat"], "lon": departure_coords["lon"], "color": [0, 0, 255]},
            {"name": arrival_code, "lat": arrival_coords["lat"], "lon": arrival_coords["lon"], "color": [255, 0, 0]},
        ]

        # Define the layer for map visualization
        layer = pdk.Layer(
            "ScatterplotLayer",
            data=data,
            get_position=["lon", "lat"],
            get_color="color",
            get_radius=50000,  # Radius in meters
        )

        # Set the view state
        view_state = pdk.ViewState(
            latitude=(departure_coords["lat"] + arrival_coords["lat"]) / 2,
            longitude=(departure_coords["lon"] + arrival_coords["lon"]) / 2,
            zoom=3,
            pitch=0,
        )

        # Render the map
        st.pydeck_chart(pdk.Deck(layers=[layer], initial_view_state=view_state))

    else:
        st.write("Coordinates for selected airports not found. Please add more coordinates to the dictionary.")
