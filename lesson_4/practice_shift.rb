hash = { a: "ant", b: "bear" }
hash.shift

# hash.shift returns [:a, "ant"] and is destructive so hash now
# equals hash = { b: "bear" }
