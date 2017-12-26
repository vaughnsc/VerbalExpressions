#tag Class
Protected Class VerbEx
Inherits RegEx
	#tag Method, Flags = &h21
		Private Function Add(value as String) As VerbEx
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
		Function br() As String
		  return me.LineBreak
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EndCapture() As String
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
		Function LineBreak() As String
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
		  dim result as string
		  for each number as Variant in counts
		    result=result+","+str(number.IntegerValue)
		  next
		  return me.Add(result.Replace(",","{")+"}")
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
		Sub Replaced()
		  //Return replaced string
		End Sub
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
		Sub searchOneLine(value as boolean)
		  me.Options.TreatTargetAsOneLine=not value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Something() As String
		  return me.add("(?:.+)")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SomethingBut(value as String) As String
		  return me.add("(?:[^" + Sanitize(value) + "]+)")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StartCapture() As String
		  return me.add("(")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StartOfLine() As VerbEx
		  me.SearchPattern="^"+me.SearchPattern
		  Return me
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StartsWith(value as String) As VerbEx
		  return me.Add(StartOfLine).add(Sanitize(value))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StopAtFirst(value as Boolean)
		  me.Options.Greedy=not value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function tab() As String
		  return "\t"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( Alias = "then" )  Function Then_(value as Variant) As Verbex
		  return me.add(Sanitize(value))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString() As String
		  return me.SearchPattern
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function whitespace() As String
		  return "\\s"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub withAnyCase(value as Boolean=true)
		  me.Options.CaseSensitive=not value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Word() As String
		  return  "\w+"
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
