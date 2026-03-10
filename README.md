# Matlab-Cellular-Automata
This project explores the emergent patterns and chaos that come from simple systems. The system starts with a row of values in a one-dimensional array, which evolves at every timestep. A two-dimensional array is created as a result, with the Y-axis acting as the time dimension.

The value of each element in the array is either 1 (yellow) or 0 (blue). Rules involving 'triplets' of array values determine the next value of the element at triplet's center. Every possible triplet is considered - 000, 001, 010, 100, 101, etc. Every triplet type has a corresponding output value (1 or 0). Changing the output values results in varying system behaviour.

Visually, rules in action look like "if the value above me and its neighbours look like 111, then I become 0". Determining the system's evolution involves looping through these rules and updating values as needed. Changing the output values results in different evolution patterns.
