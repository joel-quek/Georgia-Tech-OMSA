import streamlit as st
import joblib
import numpy as np

# Load your pre-trained model
model = joblib.load('rf_model.pkl')  # Ensure this path is correct

# Title and description for the app
st.title("Flight Delay Predictor")
st.write("Enter the following flight details to predict the departure delay:")

# Create input fields for each feature
departure = st.text_input("Departure Code")
arrival = st.text_input("Arrival Code")
airline = st.text_input("Airline Code")
month = st.number_input("Month", min_value=1, max_value=12, step=1)
crs_dep_time = st.number_input("Scheduled Departure Time (CRS_DEP_TIME)", min_value=0, max_value=2359)
crs_elapsed_time = st.number_input("Scheduled Elapsed Time (CRS_ELAPSED_TIME)", min_value=0.0)
distance = st.number_input("Distance", min_value=0.0)

# When the button is pressed, perform prediction
if st.button("Predict Delay"):
    # Prepare input for the model
    input_features = np.array([[month, crs_dep_time, crs_elapsed_time, distance]])
    
    # Predict delay
    delay_prediction = model.predict(input_features)
    
    # Display the result
    st.write(f"Estimated Departure Delay: {delay_prediction[0]:.2f} minutes")
