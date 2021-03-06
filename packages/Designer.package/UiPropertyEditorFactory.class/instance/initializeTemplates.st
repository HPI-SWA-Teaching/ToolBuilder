initialization
initializeTemplates

	templates := IdentityDictionary new.
	templates
		at: Boolean put: [UiCheckBox new icon: nil; text: nil];
		at: String put: [UiLineEdit new hResizing: #spaceFill];
		at: Integer put: [UiLineEdit new hResizing: #spaceFill;
			converter: [:raw | raw asString asInteger ifNil: [0]]];
		at: Point put: [UiLineEdit new hResizing: #spaceFill;
			converter: [:raw | | result |
				result := [Compiler evaluate: raw asString] on: Error do: [nil].
				(result isKindOf: Point) ifTrue: [result] ifFalse: [0@0]]];
		at: Rectangle put: [UiLineEdit new hResizing: #spaceFill;
			converter: [:raw | | result |
				result := [Compiler evaluate: raw asString] on: Error do: [nil].
				 (result isKindOf: Rectangle) ifTrue: [result] ifFalse: [0@0 corner: 0@0]]];
		at: Object put: [UiLineEdit new hResizing: #spaceFill;
			converter: [:raw | [Compiler evaluate: raw asString] on: Error do: [nil]]];
		at: Float put: [UiLineEdit new hResizing: #spaceFill;
			converter: [:raw | [(Float readFrom: raw asString readStream)] on: Error do: [:e | 0.0]]];
		at: Form put: [UiPushButton new hResizing: #spaceFill; text: 'Choose...'];
		at: Array put: [:list | | e |
			e := UiComboBox new hResizing: #spaceFill; converter: [:item | item asString asSymbol].
			list do: [:value | e addText: value asString].
			e].