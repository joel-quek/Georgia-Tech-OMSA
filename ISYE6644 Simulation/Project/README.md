
# ISYE6644 Advanced Pandemic Flu Spread Project

## Project Overview
This project, conducted by Joel Zhu Hui Quek, Wei Sin Ho, and Zehao Chen, focuses on optimizing non-pharmaceutical and pharmaceutical interventions to mitigate influenza pandemic spread through a simulation-based approach. The simulation models the spread of an infectious disease within a large population under various intervention strategies, providing insights into the effectiveness of these interventions in controlling the disease spread.

## Repository Structure
Contains all source code files for the simulation.


## Simulation Model
The model simulates the spread of an infectious disease within a hypothetical population to understand the dynamics of transmission without interventions and evaluates various intervention strategies such as vaccination and social distancing.

### Key Components
- **Calculating New Infections**: Simulates daily interactions between infectious and susceptible individuals.
- **Updating Status**: Uses a stochastic approach to determine daily recoveries and deaths.
- **Applying Vaccination**: Implements daily vaccinations, adjusting the susceptible and vaccinated populations accordingly.

## Installation
To set up the simulation environment:
```bash
git clone https://github.com/joel-quek/Georgia-Tech-OMSA/tree/main/ISYE6644%20Simulation/Project
cd ISYE6644%20Simulation/Project
pip install -r requirements.txt
```

## Usage
To run the simulation:
```bash
python simulation.py
```

## Contributing
Contributions to this project are welcome. Please fork the repository and submit a pull request with your proposed changes.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments
This project was developed as part of the coursework for ISYE6644 at Georgia Tech. Thanks to all contributors and reviewers.
