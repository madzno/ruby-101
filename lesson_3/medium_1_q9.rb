def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end




bar(foo)
#return value "no"
#return value of "foo" will always be "yes". Pass "yes" into bar as param
# "yes" == "no" evaluates to false and thus "no" will be returned
