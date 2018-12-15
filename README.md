# XojoVerbalExpressions
My implementation to https://github.com/VerbalExpressions
Done sone time ago, I reached out to include at the meain site; haven't heard back :)

***

Initial work Vaughn S. Cordero 25 December 2017

This note added 22 January 2018

Please keep this note in the class and append any modifications separately.

Xojo implmentation of VerbalExpressions, originally described at:
https://github.com/VerbalExpressions/implementation/wiki/List-of-methods-to-implement
Required methods noted in VerbalExpressionsInterface.

Note that **Then** and **Or** are Xojo reserved words: **Then_** and **Or_** are used instead.

Basic usage: Subclassed from Regex, so instatiate wherever you would use a regex
and build your expression:

```
me.Expression=new VerbEx
me.Expression=me.Expression.StartOfLine.Then_("http").Maybe("s").Then_("://")_
.Maybe("www").AnythingBut(" ").EndOfLine
```

"StartsWith" is a convenience method to demonstrate how syntactic sugar can be added,
combining 'StartOfLine' and 'Then(value)'

"Matches" is a convenience method that returns a Variant, which can be used as Boolean or to get the actual number of matches:
```
If verbex.matches then...
  Select case verbex.Matches
  Case 1
  …
  Case 2
  …
  End
End
```
VerbEx also exposes Regex.SearchPattern with both `VerbEx.ToString` and `VerbEx.Operator_Convert As String` if you want to access the 'built' regular expression. In the first example above, we could add:
```
dim test as string=me.expression 
//string value is "^http(?:s)?\://(?:www)?(?:[^ ]*)$"
```

In the sample app, this is used to show the radio button tooltips.

N.B. It does not output RegExOptions prefixes/suffixes in the built string.

A simple app with three test scenarios was included with this class.
