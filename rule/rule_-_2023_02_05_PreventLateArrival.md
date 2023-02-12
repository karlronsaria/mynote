# rule
- name: prevent late arrival
- assume
  - expected arrival time
- define
  - arrival time window
    - reasonable average time to arrive
      - plus buffer
  - reasonable departure time
    - expected arrival time minus arrival time window
  - when
    - expected arrival time is not known
      - expected arrival time ← lower bound on all corresponding expected arrival times for the week
- proscribe
  1. willful and controllable action capable of blocking process of arrival
    - occurs within arrival time window
  2. start of day occurs within time frame before reasonable departure time
    - nearly equal to arrival time buffer
- prescribe
  1. have already departed without violating ``proscribe: 1``
    - with evidence
    - example
      - have car started
  2. have already started day without violating ``proscribe: 2``
    - with evidence
    - example
      - have car started
  3. self-audit before arrival
    - guilt incurs immediate day penalty
