#preparation, don't mind this
#ls > lsResult

# syntax
# grep <parameters> <pattern> <file name>
grep sh lsResult
#again, same thing as above line: ls | grep sh

#param -c = count; instead of showing lines, only numbers them
grep -c sh lsResult

#param -i = insensitive case
grep -i SH lsResult

#param -v = inVerted search; everything that does NOT match the given pattern
grep -v sh lsResult


