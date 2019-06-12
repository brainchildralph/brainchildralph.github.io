---
---

```
# Write source to destination 
dd if=${pathOfInput} of=${pathOfOutput} bs=${sizeOfBlock} 

# Read progress
kill -USR1 $(pgrep ^dd)
```

