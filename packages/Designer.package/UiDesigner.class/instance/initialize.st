initialization
initialize

	super initialize.
	self ui setupUi: self.
	self ui prop addPaneSplitters.	
	
	self selectDefaultModel.
	
	self ui centralScroller
		borderWidth: 0;
		fillStyle: (BitmapFillStyle fromForm: self gridForm).
	
	"BAD: Viewport should not be accessed from the outside."
	self ui widgetList viewport dragEnabled: true.
	self ui widgetList
		selectionMode: UiViewSingleSelection;
		dragDropSpec: (UiItemViewDragDropSpec new
			dropEnabled: false;
			dragTransferType: #widgetClass).
	
	 self ui filterEdit deferEditSignalTime: 300.
	
	propertyTable := self ui propertyScroller widget.
		
	self connect: self ui filterEdit signal: #textEdited: toSelector: #nameFilter:.		
		
	self connect: self ui newBtn signal: #clicked: toSelector: #reset.
	self connect: self ui saveBtn signal: #clicked: toSelector: #save.
	self connect: self ui openBtn signal: #clicked: toSelector: #load.
	
	self connect: self ui pluggableNewButton signal: #clicked: toSelector: #pluggableNew.
	self connect: self ui pluggableOpenButton signal: #clicked: toSelector: #pluggableOpen.
	self connect: self ui pluggableSaveButton signal: #clicked: toSelector: #pluggableSave.