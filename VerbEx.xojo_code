#tag Class
Protected Class VerbEx
Inherits RegEx
Implements VerbalExpressionsInterface
	#tag Method, Flags = &h21
		Private Function Add(value as Variant) As VerbEx
		  if value.IsNull or value.StringValue="" Then
		    dim err as new UnsupportedOperationException
		    err.Message="Add(value) cannot be empty"
		    raise err
		  end
		  
		  me.SearchPattern=me.SearchPattern+value
		  return me
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Any(value as String) As VerbEx
		  return me.AnyOf(Sanitize(value))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AnyOf(value as String) As VerbEx
		  return me.Add("(?:[" + Sanitize(value) + "])")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Anything() As verbex
		  return me.add("(?:.*)")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AnythingBut(value as string) As Verbex
		  return me.add("(?:[^" + Sanitize(value) + "]*)")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function br() As VerbEx
		  return me.LineBreak
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function digit() As VerbEx
		  return me.add(DigitToken)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EndCapture() As VerbEx
		  return me.Add(")")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EndOfLine() As VerbEx
		  return me.Add("$")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Escape(value as variant) As String
		  const reserved="[\].|*?+(){}^$\\:=[]"
		  dim escape as new regex
		  escape.SearchPattern="("+reserved+")"
		  escape.Options.Greedy=true
		  escape.ReplacementPattern="\\$&"
		  Return escape.Replace(value)
		  
		  //PCRE
		  // .^$*+?()[{\|
		  // and these inside character classes:
		  // ^-]\
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Find(value as String) As VerbEx
		  return me.Add ("(?:"+Sanitize(value)+")")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LineBreak() As VerbEx
		  //this may be academic, as RegExOptions.LineEndType defaults to any ending
		  return me.add("(?:(?:\n)|(?:\r\n))")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Matches(target as String) As Variant
		  Match=Search(target)
		  try
		    return Match.SubExpressionCount
		  catch
		    Return False
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Maybe(value as String) As VerbEx
		  return me.Find(Sanitize(value)).Add("?")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Multiple(paramarray counts as variant) As VerbEx
		  //should allow [value][exact|min][max]
		  
		  dim value as Variant=nil
		  dim suffix as String="*"
		  
		  try
		    value=counts(0)
		  catch OutOfBoundsException
		    return me.Add(suffix) //applies to previous item
		  end
		  
		  if value.Type=Variant.TypeString then
		    value="["+Sanitize(value)+"]"
		    counts.remove(0)
		  end
		  
		  //treat anything else as numeric
		  
		  for each number as Variant in counts
		    suffix=suffix+","+str(number.IntegerValue)
		  next
		  suffix=suffix.Replace("*","").replace(",","{")+"}"
		  
		  return me.Add(value+suffix)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function oneOrMore(value as string) As VerbEx
		  return me.Add("["+Sanitize(value)+"]+")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As String
		  Return me.ToString
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( Alias = "Or" )  Function Or_(value as string) As VerbEx
		  return me.Add(" | ")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Replaced(value as String) As String
		  if me.SearchPattern.Len>0 then
		    
		    return me.Replace
		    
		    
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Sanitize(value as Variant) As String
		  if value.IsNull or value.StringValue="" then
		    
		    raise new NilObjectException
		    
		  end
		  
		  return escape(value)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function searchOneLine(value as boolean) As VerbEx
		  me.Options.TreatTargetAsOneLine=not value
		  
		  return me
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Something() As VerbEx
		  return me.add("(?:.+)")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SomethingBut(value as String) As VerbEx
		  return me.add("(?:[^" + Sanitize(value) + "]+)")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StartCapture() As Verbex
		  return me.add("(")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StartOfLine() As VerbEx
		  'me.SearchPattern="^"+me.SearchPattern
		  Return me.Add("^")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( Convenience )  Function StartsWith(value as String) As VerbEx
		  return me.Add(StartOfLine).add(Sanitize(value))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StopAtFirst(value as Boolean) As VerbEx
		  me.Options.Greedy=not value
		  
		  exit
		  
		  //second option after subexpression (toggle)
		  if value<>me.Options.Greedy then
		    return me.add("?")
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function tab() As VerbEx
		  return me.add(TabToken)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( Alias = "Then" )  Function Then_(value as Variant) As Verbex
		  return me.add(Sanitize(value))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString() As String
		  return me.SearchPattern
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Whitespace() As VerbEx
		  return me.add(WhitespaceToken)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function withAnyCase(value as Boolean = true) As VerbEx
		  me.Options.CaseSensitive=not value
		  return me
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Word() As VerbEx
		  return me.Add(WordToken)
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Match As RegExMatch
	#tag EndProperty

	#tag Property, Flags = &h0
		prefixes As String
	#tag EndProperty

	#tag Property, Flags = &h0
		suffixes As String
	#tag EndProperty


	#tag Constant, Name = CarriageReturnToken, Type = String, Dynamic = False, Default = \"\\r", Scope = Public
	#tag EndConstant

	#tag Constant, Name = DigitToken, Type = String, Dynamic = False, Default = \"\\d", Scope = Public
	#tag EndConstant

	#tag Constant, Name = LineFeedToken, Type = String, Dynamic = False, Default = \"\\n", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TabToken, Type = String, Dynamic = False, Default = \"\\t", Scope = Public
	#tag EndConstant

	#tag Constant, Name = WhitespaceToken, Type = String, Dynamic = False, Default = \"\\s", Scope = Public
	#tag EndConstant

	#tag Constant, Name = WordToken, Type = String, Dynamic = False, Default = \"\\w+", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Options"
			Visible=true
			Type="RegExOptions"
			EditorType="RegExOptions"
		#tag EndViewProperty
		#tag ViewProperty
			Name="prefixes"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ReplacementPattern"
			Visible=true
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SearchPattern"
			Visible=true
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SearchStartPosition"
			Visible=true
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="suffixes"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
