source("helper/helper.R")

expect_true(isNamespaceLoaded("base"))
expect_true(isNamespaceLoaded("backports"))
expect_false(isNamespaceLoaded("..notexisting.."))
