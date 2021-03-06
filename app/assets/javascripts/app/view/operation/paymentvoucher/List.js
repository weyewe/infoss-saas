Ext.define('AM.view.operation.paymentvoucher.List' ,{
  	extend: 'Ext.grid.Panel',
  	alias : 'widget.paymentvoucherlist',

  	store: 'PaymentVouchers',  
 

	initComponent: function() {
		this.columns = [
			// { header: 'ID', dataIndex: 'id'},
			// { header: 'Kode',  dataIndex: 'code', flex: 1},
			// { header: 'No Bukti',  dataIndex: 'no_bukti', flex: 1},
			// {	header: 'Contact', dataIndex: 'contact_name', flex: 2 },
			// {	header: 'CashBank', dataIndex: 'cash_bank_name', flex: 2 },
			// {	header: 'Payment Date', dataIndex: 'payment_date', flex: 2 },
			// {	header: 'Is GBCH', dataIndex: 'is_gbch', flex: 2 },
			// {	header: 'GBCH No', dataIndex: 'gbch_no', flex: 2 },
			// {	header: 'Due Date', dataIndex: 'due_date', flex: 2 },
			
			
			// {	header: 'Total Amount', dataIndex: 'amount', flex: 2 },
			// {	header: 'Currency', dataIndex: 'exchange_name', flex: 2 },
			// {	header: 'Rate', dataIndex: 'rate_to_idr', flex: 2 },
			// {	header: 'PPh23', dataIndex: 'total_pph_23', flex: 2 },
			// {	header: 'PPh21', dataIndex: 'total_pph_21', flex: 2 },
			// {	header: 'Biaya Bank', dataIndex: 'biaya_bank', flex: 2 },
			// {	header: 'Pembulatan', dataIndex: 'pembulatan', flex: 2 },
			{
				xtype : 'templatecolumn',
				text : "Info",
				flex : 3,
				tpl : 	'Kode:  <br /><b>{code}</b>'  + '<br />' + '<br />' +
							'Tujuan: <br /><b>{contact_name}</b>' + '<br />' + '<br />' +
							'No Bukti: <br /><b>{no_bukti}</b>' 
			},
			{
				xtype : 'templatecolumn',
				text : "Pembayaran",
				flex : 3,
				tpl : 	'CashBank:  <br /><b>{cash_bank_name}</b>'  + '<br />' + '<br />' +
							'Payment Date: <br /><b>{rate_to_idr}</b>' + '<br />' + '<br />' +
							'GBCH: <br /><b>{is_gbch}</b>' + '<br />' + '<br />' +
							'GBCH No: <br /><b>{gbch_no}</b>' + '<br />' + '<br />' +
							'GBCH Due Date: <br /><b>{due_date}</b>' 
			},
			
			{
				xtype : 'templatecolumn',
				text : "Jumlah",
				flex : 3,
				tpl : 	'Total:  <br /><b>{amount} {cash_bank_exchange_name}</b>'  + '<br />' + '<br />' +
							'Exchange Rate: <br /><b>{rate_to_idr}</b>' + '<br />' + '<br />' +
							'PPh21: <br /><b>{total_pph_21}</b>' + '<br />' + '<br />' +
							'PPh23: <br /><b>{total_pph_23}</b>' + '<br />' + '<br />' +
							'Biaya Bank: <br /><b>{biaya_bank}</b>' + '<br />' + '<br />' + 
							'Pembulatan: <br /><b>{pembulatan}</b>' 
			},
			
			
			{
				xtype : 'templatecolumn',
				text : "Konfirmasi",
				flex : 3,
				tpl : 	'Status Konfirmasi:  <b>{is_confirmed}</b>'  + '<br />' + '<br />' +
							'Tanggal Konfirmasi: <br /><b>{confirmed_at}</b>' 
			},
			{
				xtype : 'templatecolumn',
				text : "Reconcile",
				flex : 3,
				tpl : 	'Status Reconcile:  <b>{is_reconciled}</b>'  + '<br />' + '<br />' +
							'Tanggal Reconcile: <br /> <b>{reconciliation_date}</b>' 
			},
			
		];

		this.addObjectButton = new Ext.Button({
			text: 'Add',
			action: 'addObject'
		});

		this.editObjectButton = new Ext.Button({
			text: 'Edit',
			action: 'editObject',
			disabled: true
		});

		this.deleteObjectButton = new Ext.Button({
			text: 'Delete',
			action: 'deleteObject',
			disabled: true
		});
		
		this.confirmObjectButton = new Ext.Button({
			text: 'Confirm',
			action: 'confirmObject',
			disabled: true
		});
		
		this.reconcileObjectButton = new Ext.Button({
			text: 'Reconcile',
			action: 'reconcileObject',
			disabled: true
		});
		
		this.unconfirmObjectButton = new Ext.Button({
			text: 'Unconfirm',
			action: 'unconfirmObject',
			disabled: true,
			hidden : true
		});
		
 
		this.downloadButton = new Ext.Button({
			text: 'Print',
			action: 'downloadObject',
			disabled: true });
 
		this.unreconcileObjectButton = new Ext.Button({
			text: 'Unreconcile',
			action: 'unreconcileObject',
			disabled: true,
			hidden : true
 
		});
		
		this.searchField = new Ext.form.field.Text({
			name: 'searchField',
			hideLabel: true,
			width: 200,
			emptyText : "Search",
			checkChangeBuffer: 300
		});
		
	 
		this.tbar = [this.addObjectButton, this.editObjectButton, this.deleteObjectButton , 
			'-', 
				this.confirmObjectButton, this.unconfirmObjectButton,

				this.confirmObjectButton, this.unconfirmObjectButton,this.reconcileObjectButton, 
				this.unreconcileObjectButton,
				this.downloadButton,  
				'->',
				this.searchField ];
	 


		
		this.bbar = Ext.create("Ext.PagingToolbar", {
			store	: this.store, 
			displayInfo: true,
			displayMsg: 'Displaying topics {0} - {1} of {2}',
			emptyMsg: "No topics to display" 
		});

		this.callParent(arguments);
	},
 
	loadMask	: true,
	
	getSelectedObject: function() {
		return this.getSelectionModel().getSelection()[0];
	},

	enableRecordButtons: function() {
		this.editObjectButton.enable();
		this.deleteObjectButton.enable(); 
		this.downloadButton.enable();
		
		selectedObject = this.getSelectedObject();
		
		if( selectedObject && selectedObject.get("is_confirmed") == true ){
			this.confirmObjectButton.hide();
			this.unconfirmObjectButton.show();
			this.unconfirmObjectButton.enable();
		}else{
			this.confirmObjectButton.enable();
			this.confirmObjectButton.show();
			this.unconfirmObjectButton.hide();
		}
		if( selectedObject && selectedObject.get("is_confirmed") == true &&
		    selectedObject.get("is_gbch") == true && selectedObject.get("is_reconciled") == false)  
		{
			this.confirmObjectButton.hide();
			this.unreconcileObjectButton.show();
			this.unreconcileObjectButton.enable();
		}else{
			this.confirmObjectButton.enable();
			this.reconcileObjectButton.show();
			this.unreconcileObjectButton.hide();
		}
	},

	disableRecordButtons: function() {
		this.editObjectButton.disable();
		this.deleteObjectButton.disable();
		this.unconfirmObjectButton.disable();
		this.confirmObjectButton.disable(); 
		this.downloadButton.disable();
 
		selectedObject = this.getSelectedObject();
		
		if( selectedObject && selectedObject.get("is_confirmed") == true ){
			this.confirmObjectButton.hide();
			this.unconfirmObjectButton.show(); 
		}else{
			
			this.confirmObjectButton.show();
			this.unconfirmObjectButton.hide();
		}
		if( selectedObject && selectedObject.get("is_reconciled") == true ){
			this.reconcileObjectButton.hide();
			this.unreconcileObjectButton.show(); 
		}else{
			
			this.reconcileObjectButton.show();
			this.unreconcileObjectButton.hide();
		}
 
	}
});
