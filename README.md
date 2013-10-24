Diamond_Square_Noise
====================

Lua implementation of the Diamond Square algorithm, with visualization in Love

Usage: 

    ds = require('Diamond_Square_Noise')
    size = 513 #Note that size must be of the form 2^n + 1 for some integer n.
    heightmap = ds:create(size)


Diamond_Square_Noise:create() returns a 2D array with values between 0 and 255. 
