@ECHO OFF
FOR /L %%B IN (1,1,9) DO (call pos_test.cmd 0%%B)
FOR /L %%B IN (10,1,14) DO (call pos_test.cmd %%B)
FOR /L %%B IN (1,1,9) DO (call neg_test.cmd 0%%B)
FOR /L %%B IN (10,1,19) DO (call neg_test.cmd %%B)
FOR /L %%B IN (20,1,25) DO (call neg_test.cmd %%B)


DEL out.txt