#tag Interface
Protected Interface VerbalExpressionsInterface
	#tag Method, Flags = &h0
		Function Add(value as Variant) As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Any(value as String) As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AnyOf(value as String) As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Anything() As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AnythingBut(value as string) As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function br() As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function digit() As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EndCapture() As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EndOfLine() As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Find(value as String) As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LineBreak() As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Maybe(value as String) As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Multiple(paramarray counts as variant) As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function oneOrMore(value as string) As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Or_(value as string) As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Replaced(value as String) As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function searchOneLine(value as boolean) As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Something() As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SomethingBut(value as String) As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StartCapture() As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StartOfLine() As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StopAtFirst(value as Boolean) As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function tab() As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Then_(value as Variant) As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Whitespace() As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function withAnyCase(value as Boolean = true) As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Word() As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
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
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Interface
#tag EndInterface
