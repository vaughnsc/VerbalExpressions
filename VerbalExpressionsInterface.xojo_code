#tag Interface
 Attributes ( Reference = "https://github.com/VerbalExpressions/implementation/wiki/List-of-methods-to-implement" ) Protected Interface VerbalExpressionsInterface
	#tag CompatibilityFlags = ( TargetConsole and ( Target32Bit or Target64Bit ) ) or ( TargetWeb and ( Target32Bit or Target64Bit ) ) or ( TargetDesktop and ( Target32Bit or Target64Bit ) )
	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target32Bit or Target64Bit))
		Function add(value as Variant) As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function any(value as String) As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function anyOf(value as String) As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function anything() As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function anythingBut(value as string) As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function br() As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function endCapture() As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function endOfLine() As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function find(value as String) As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function lineBreak() As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function maybe(value as String) As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function multiple(paramarray counts as variant) As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function oneOrMore(value as string) As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( alias = "or" )  Function or_(value as string) As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function replace(source as string, value as String) As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function searchOneLine(value as boolean) As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function something() As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function somethingBut(value as String) As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function startCapture() As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function startOfLine() As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function stopAtFirst(value as Boolean) As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function tab() As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( alias = "Then" )  Function then_(value as Variant) As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function whitespace() As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function withAnyCase(value as Boolean = true) As VerbalExpressionsInterface
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function word() As VerbalExpressionsInterface
		  
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
