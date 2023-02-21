# recurring, actionable schedule item

## state
- before event start
  - A
- after event start
  - action item not complete
    - B
  - action item complete
    - C
- after two events start
  - action item 1 not complete
    - action item 2 not complete
      - D
  - action item 1 complete
    - action item 2 not complete
      - E
    - action item 2 complete
      - F

## analysis
- number of states
  - A-F
  - 6

- possible state markers
  - now is past date: 2
  - file exists: 2x
  - action item recorded in file: 2x
  - recorded action item complete: 2x

## condition
- state A
  - query module does nothing
- state B
  - query module produces task item if not exist
    - with current periodic datestamp
- state C
  - query module finds task item
    - with current periodic datestamp
    - and tests for completion
- state D
  - task items with datestamps form a LIFO
- dag
  - for
    - state E
    - state F
  - do
    - query module removes completed task items from previous periods

