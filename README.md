# FavoriteRxRealm


# Need 

`pod install`


# Error: 

Use case:

I have a favorite button, when it's favorited I press it again it changes to unfavorite and removes the record. When I re-favorite it it should insert the object again but it accuses this error below

Crash with error:
```
2019-02-20 09:58:44.348244-0300 Project[3851:768454] *** Terminating app due to uncaught exception 'RLMException', reason: 'Attempting to modify object outside of a write transaction - call beginWriteTransaction on an RLMRealm instance first.'
*** First throw call stack:
(0x1babecec4 0x1b9dbda40 0x101681788 0x101683208 0x100565728 0x1006aea94 0x1006aeae4 
libc++abi.dylib: terminating with uncaught exception of type NSException
```

# See

Favorite/FavoriteViewModel.swift
