/**
* @fileoverview datasources.js.
* Definición Demo en SWB Forms
* Infotec 2018
*
* @author Carlos I. Ramos Incháustegui
* @version 1.0
*/

function getFormatDate() {
    var date = new Date(Date.now());
    //return date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
    var m;
    m = date.getMonth()+1;
    return date.getFullYear() + "-" + (m<=9?"0"+m:m) + "-" + date.getDate();
}



//************************************************************
//******* Security *******************************************
//************************************************************

var roles={
    ventasMgr:"Ventas Supervisor",
    ventasRep:"Ventas Servidor",
    almacenes:"Almacenes",
    recepcionMercancias:"Recepción de Mercancías",
    productos:"Productos",
    ordenesCompra:"Ordenes de Compra",
    listasPrecio:"Listas de Precio",
    proveedores:"Proveedores",
    gerencia:"Gerencia"
    
};
var groups={gerente:"Gerente",supervisor:"Supervisor"};

var gender={male:"Hombre", female:"Mujer"};

/*
 * Profile
 * Perfil de permisos de usuario. Grupo de permisos que se asignan a un usuario.
 * @type Security
 */
eng.dataSources["Profile"]={
    scls: "Profile",
    modelid: "SWBF2",
    dataStore: "mongodb",  
    displayField: "name",
    fields:[
        {name:"name", title:"Perfil", type:"string", required: true}
    ]
};

/*
 * Permission
 * Permisos de usuario.
 * @type Security
 */
eng.dataSources["Permission"]={
    scls: "Permission",
    modelid: "SWBF2",
    dataStore: "mongodb",  
    displayField: "name",
    fields:[
        {name:"profile", title:"Perfil", stype:"select", dataSource: "Profile", required: true},
        {name:"name", title:"Nombre", type:"string", required: true},
        {name:"description", title:"Descripción", type:"string", required: true},
        {name:"roles", title:"Roles", stype:"select", valueMap:roles, multiple:true, required: true}
    ]
};

/*
 * User
 * Usuarios del sistema.
 * @type Security
 */
eng.dataSources["User"] = {
    scls: "User",
    modelid: "SWBF2",
    dataStore: "mongodb",
    displayField: "login",
    fields: [
        {name: "login", title: "Usuario", type: "string", length: "32"},
        {name: "password", title: "Contraseña", type: "password", length: "16"},
        {name: "fullname", title:"Nombre", type:"string"},
        {name: "email", title: "Correo electrónico", type: "string", length: "64"
            , validators: [
                {stype: "email"}
                ,{type: "isUnique", errorMessage: "Email ya existe registrado, intenta con otro diferente."}
            ]
        },
        {name:"roles", title:"Roles", type:"select", valueMap:roles, multiple:true},
        {name:"groups", title:"Grupos", type:"select", valueMap:groups, multiple:false},
        
        {name: "creator", title: "Usuario creador", stype: "select", dataSource: "User", required: false},
        {name: "created", title: "Fecha de creación", type: "date", required: false},
        {name: "updater", title: "Actualizado por", stype: "select", dataSource: "User", required: false},
        {name: "updated", title: "Fecha de actualización", type: "date", required: false}
    ],
    links: [
        {
            name: "person",
            title: "Persona",
            stype: "subForm",
            dataSource: "Person",
            required: true,
            fields: [
                {name: "firstName"},
                {name: "lastName"},
                {name: "secLastName"},
                {name: "gender"},
                {name: "birthday"}
            ]
        }
    ]

};

//**************************************************************
//******* Data Sources *****************************************
//**************************************************************

/*
 * Person
 * Datos de empleado usuario del Sigec.
 * @type Transactional
 */
eng.dataSources["Person"] = {
    scls: "Person",
    modelid: "SWBF2",
    dataStore: "mongodb",
    displayField: "fullname",
    fields: [
        {name: "firstName", title: "Nombre", type: "string", length: "64", required: true},
        {name: "lastName", title: "Primer Apellido", type: "string", length: "64", required: true},
        {name: "secLastName", title: "Segundo Apellido", type: "string", length: "64", required: false},
        {name: "gender", title: "Género", type: "select", valueMap: "gender", required: true, defaultValue: "male"},
        {name: "birthday", title: "Cumpleaños", type: "date", required: false}
    ]
};

/*
 * Contact
 * Datos de contacto.
 * @type Transactional
 */
eng.dataSources["Contact"] = {
    scls: "Contact",
    modelid: "SWBF2",
    dataStore: "mongodb",
    displayField: "fullname",
    fields: [
        {name: "fullname", title: "Nombre completo", type: "string", required: true},
        {
            name: "email", title: "Correo electrónico", type: "string", length: "64", required: true
            ,validators: [
                {stype: "email"},
                {type: "isUnique", errorMessage: "Ya se tiene registrada esta cuenta de correo, intenta con uno diferente."}
            ]
        },
        {name: "phone", title: "Teléfono", type: "string", length: "64", required: true},
        {name: "extension", title: "Extensión", type: "string", length: "8", required: false},
    ]
};

/*
 * Tax
 * Impuestos, contribución tributaria.
 * @type Catalog
 */
eng.dataSources["Tax"] = {
    scls: "Tax",
    modelid: "SWBF2",
    dataStore: "mongodb",    
    displayField: "iva",
    fields: [
        {name: "iva", title: "Iva", required: true, type: "string"},
        {name: "value", title: "Valora", required: true, type: "float"}
    ]
};
var taxes = eng.getDataSource("Tax").toValueMap("value", "iva");

/**
 * Address
 * Domicilio de una persona o proveedor.
 * @type dataSource
 */
eng.dataSources["Address"] = {
    scls: "Address",
    modelid: "SWBF2",
    dataStore: "mongodb",
    fields: [
        {name: "street", title: "Calle", type: "string", required: true}
        ,{name: "numExt", title: "Numero exterior", type: "string", required: true}
        ,{name: "numInt", title: "Numero interior", type: "string", required: false}
        ,{ame: "country", title: "Pais", type: "string", required: false}
        ,{name: "state", title: "Estado", type: "string", required: true}
        ,{name: "county", title: "Alcaldía/Municipio", type: "string", required: true}
        ,{name: "cp", title: "CP", type: "string", required: true}
        ,{name: "city", title: "Colonia/barrio/población", type: "string", required: true}
    ]
};

/**
 * Branch
 * Sucursales.
 * @type dataSource
 */
eng.dataSources["Branch"] = {
    scls: "Branch",
    modelid: "SWBF2",
    dataStore: "mongodb",
    fields: [
        {name: "number", title: "Número", type: "int", required: true}
        ,{name: "branchName", title: "Nombre", type: "string", required: true}
        ,{name: "branchKey", title: "Clave", type: "string", required: false}
        ,{name: "phone", title: "Teléfono(s)", type: "string", required: true}
    ],
//    links: [
//        {name: "address", title: "Dirección", stype: "subForm", dataSource: "Address", required: true}
//    ]
};

/*
 * Supplier
 * Proveedor de productos para su venta.
 * @type Catalog
 */
eng.dataSources["Supplier"] = {
    scls: "Supplier",
    modelid: "SWBF2",
    dataStore: "mongodb",    
    displayField: "tradeName",
    fields: [
        {name: "businessName", title: "Razón Social", type: "string", required: true},
        {name: "tradeName", title: "Nombre comercial", type: "string", required: true},
        {name: "rfc", title: "RFC", type: "string", required: true},
        {
            name: "email", title: "Correo electrónico", type: "string", required: false
            ,validators: [
                {stype: "email"}
            ]
        },
        {name: "branchOffice", title: "Sucursal", type: "string", required: true},
        {
            name: "website", title: "Página Web", type: "string", required: false
            ,validators: [
                {stype: "url"},
                {type: "isUnique", errorMessage: "Ya se tiene registrada esta página web."}
            ]
        },
        {name: "phone", title: "Teléfono(s)", type: "string", required: true},
        {name: "comments", title: "Comentarios", type: "string", required: false},
        
        {name: "created", title: "Fecha de creación", type: "date", required: false},
        {name: "updated", title: "Fecha de actualización", type: "date", required: false}
    ],
    links: [
        {name: "address", title: "Dirección", stype: "subForm", dataSource: "Address"},
        {name: "contacts", title: "Contactos", stype: "tab", dataSource: "Contact"}
    ]
};

eng.dataSources["CFDI"] = {
    scls: "CFDI",
    modelid: "SWBF2",
    dataStore: "mongodb",    
    displayField: "class",
    fields: [
        {name: "type", title: "Tipo", required: true, stype: "select", dataSource: "CFDIType"},
        {name: "division", title: "División", required: true, stype: "select", dataSource: "CFDIDivision"},
        {name: "group", title: "Grupo", required: true, stype: "select", dataSource: "CFDIGroup"},
        {name: "class", title: "Clase", required: true, stype: "select", dataSource: "CFDIClass"}
    ]
};

eng.dataSources["CFDIType"] = {
    scls: "CFDIType",
    modelid: "SWBF2",
    dataStore: "mongodb",    
    displayField: "typeName",
    fields: [
        {name: "typeName", title: "Tipo", required: true, type: "string"}
    ]
};

eng.dataSources["CFDIDivision"] = {
    scls: "CFDIDivision",
    modelid: "SWBF2",
    dataStore: "mongodb",    
    displayField: "divisionName",
    fields: [
        {name: "divisionName", title: "Division", required: true, type: "string"}
    ]
};

eng.dataSources["CFDIGroup"] = {
    scls: "CFDIGroup",
    modelid: "SWBF2",
    dataStore: "mongodb",    
    displayField: "groupName",
    fields: [
        {name: "groupName", title: "Grupo", required: true, type: "string"}
    ]
};

eng.dataSources["CFDIClass"] = {
    scls: "CFDIClass",
    modelid: "SWBF2",
    dataStore: "mongodb",    
    displayField: "className",
    fields: [
        {name: "className", title: "Clase", required: true, type: "string"}
    ]
};

eng.dataSources["CFDIU"] = {
    scls: "CFDIU",
    modelid: "SWBF2",
    dataStore: "mongodb",    
    displayField: "name",
    fields: [
        {name: "type", title: "Tipo", required: true, stype: "select", dataSource: "CFDIUType"},
        {name: "key", title: "Clave", required: true, type: "string"},
        {name: "name", title: "Nombre", required: true, type: "string"}
    ]
};

eng.dataSources["CFDIUType"] = {
    scls: "CFDIUType",
    modelid: "SWBF2",
    dataStore: "mongodb",    
    displayField: "typeName",
    fields: [
        {name: "typeName", title: "Tipo", required: true, type: "string"}
    ]
};

/*
 * Category1
 * Primer categoría de productos.
 * @type Catalog
 */
eng.dataSources["Category1"] = {
    scls: "Category1",
    modelid: "SWBF2",
    dataStore: "mongodb",    
    displayField: "name",
    fields: [
        {name: "name", title: "Categoría 1", required: true, type: "string"}
    ]
};

/*
 * Category2
 * Segunda categoría de productos.
 * @type Catalog
 */
eng.dataSources["Category2"] = {
    scls: "Category2",
    modelid: "SWBF2",
    dataStore: "mongodb",    
    displayField: "name",
    fields: [
        {name: "name", title: "Categoría 2", required: true, type: "string"},
        {name: "category1", title: "Categoría 1", required: true, stype: "select", dataSource: "Category1"}
    ]
};

/*
 * PriceList
 * Lista de precios.
 * @type Catalog
 */
eng.dataSources["PriceList"] = {
    scls: "PriceList",
    modelid: "SWBF2",
    dataStore: "mongodb",    
    displayField: "name",
    fields: [
        {name: "name", title: "Nombre de la Lista", required: true, type: "string"},
        {name: "created", title: "Fecha de creación", type: "date", required: false},
        {name: "updated", title: "Fecha de actualización", type: "date", required: false}
    ]
};


eng.dataSources["Product"] = {
    scls: "Product",
    modelid: "SWBF2",
    dataStore: "mongodb",    
    displayField: "productName",
    fields: [
        {name: "code", title: "Código", required: true, type: "string"},
        {name: "productName", title: "Nombre", required: true, type: "string"},
        {name: "description", title: "Descripción", type: "string"},
        {
            name: "CFDI", title: "Clave CFDI", stype: "select", dataSource: "CFDI", required: true
            ,selectFields: [
                {name: "type"},
                {name: "division"},
                {name: "group"},
                {name: "class"}
            ]
            ,displayFormat: function(value, record) {
                if(!value) return "";
                var cfdiDS = eng.getDataSource("CFDI");
                var cfdiClassDS = eng.getDataSource("CFDIClass");
                var clss = cfdiClassDS.fetchObjById(value);
                if(clss) {
                    return clss.className;
                }
                return value;
            }
            ,formatCellValue: function(value, record, rowNum, colNum, grid) {
                if(!value) return "";
                var cfdiDS = eng.getDataSource("CFDI");
                var cfdiClassDS = eng.getDataSource("CFDIClass");
                var clss = cfdiClassDS.fetchObjById(value);
                if(clss) {
                    return clss.className;
                }
                return value;
            }
        },
        {name: "existence", title: "Existencia", type: "int", defaultValue: 0},
        {name: "CFDIU", title: "Unidad CFDI", stype: "select", dataSource: "CFDIU", required: true},
        {name: "foto", title: "Foto", stype: "file", required: false },
        
        {name: "created", title: "Fecha de creación", type: "date", required: false},
        {name: "updated", title: "Fecha de actualización", type: "date", required: false}
    ]
    ,links: [
        {name: "optionalData", title: "Datos Opcionales", required: false, stype: "tab", dataSource: "OptionalProductData"},
        {name: "prices", title: "Precios", required: false, stype: "tab", dataSource: "ProductPrice"}
    ]
};

eng.dataSources["OptionalProductData"] = {
    scls: "OptionalProductData",
    modelid: "SWBF2",
    dataStore: "mongodb",    
    displayField: "sku",
    fields: [
        {name: "sku", title: "SKU", required: false, type: "string"},
        {name: "iva", title: "IVA", required: false, type: "select", valueMap: taxes},
        {name: "volume", title: "Volumen", required: false, type: "float"},
        {name: "weight", title: "Peso", required: false, type: "float"},
        {
            name: "category1", title: "Nivel 1"
            ,required: true, stype: "select"
            ,dataSource: "Category1", dependentSelect: "category2"
            ,changed: "form.clearValue('category2');"
        },
        {
            name: "category2", title: "Nivel 2"
            ,required: true
            ,stype: "select", dataSource: "Category2"
            ,getPickListFilterCriteria: function () {
                var criteria = this.form.getValue("category1");
                return {category1: criteria};
            }
        },
        
        {name: "created", title: "Fecha de creación", type: "date", required: false},
        {name: "updated", title: "Fecha de actualización", type: "date", required: false}
    ]
};

eng.dataSources["ProductPrice"] = {
    scls: "ProductPrice",
    modelid: "SWBF2",
    dataStore: "mongodb",    
    displayField: "list",
    fields: [
        {name: "list", title: "Lista de Precio", required: false, stype: "grid", dataSource: "ProductPriceList"}
    ]
};

eng.dataSources["ProductPriceList"] = {
    scls: "ProductPriceList",
    modelid: "SWBF2",
    dataStore: "mongodb",    
    displayField: "list",
    fields: [
        {name: "list", title: "Lista de Precio", required: false, stype: "select", dataSource: "PriceList"},
        {name: "price", title: "Valor", required: false, type: "float"},
        
        {name: "created", title: "Fecha de creación", type: "date", required: false},
        {name: "updated", title: "Fecha de actualización", type: "date", required: false}
    ]
};

/*
 * PurchaseOrder
 * Orden de compra. Las órdenes de compra permiten actualizar la existencia de
 * productos en un almacén.
 * @type Transactional
 */
eng.dataSources["PurchaseOrder"] = {
    scls: "PurchaseOrder",
    modelid: "SWBF2",
    dataStore: "mongodb",    
    displayField: "number",
    fields: [
        {name: "number", title: "Número", required: true, type: "string", prompt: "Número de Orden"},
        {name: "supplier", title: "Proveedor", required: true, stype: "select", dataSource: "Supplier"},
        {name: "order", title: "Productos", required: true, stype: "grid", dataSource: "ItemOrder"},
        
        {name: "user", title: "Comprador", stype: "select", dataSource: "User", required: false},
        {name: "created", title: "Fecha de creación", type: "date", required: false}
    ]
};

/*
 * MerchandiseRcv
 * Recepción de mercancía correspondiente a una Orden de Compra (PurchaseOrder). 
 * @type Transactional
 */
eng.dataSources["MerchandiseRcv"] = {
    scls: "MerchandiseRcv",
    modelid: "SWBF2",
    dataStore: "mongodb",    
    displayField: "name",
    fields: [
        {name: "number", title: "Número", required: true, type: "string", prompt: "Número de Orden"},
        {name: "supplier", title: "Proveedor", required: true, stype: "select", dataSource: "Supplier"},
        {name: "purchaseOrder", title: "Orden de Compra", required: true, stype: "select", dataSource: "PurchaseOrder"},
        {name: "order", title: "Productos", required: true, stype: "grid", dataSource: "ItemOrder"},
        {name: "status", title: "Orden Surtida", type: "boolean"},
        {name: "comments", title: "Comentarios y Observaciones", type: "string", required: true},
        
        {name: "subtotal", title: "Subtotal", type: "float", required: true},
        {name: "discount", title: "Descuento", type: "float", required: true},
        {name: "iva", title: "IVA", type: "float", required: true},
        {name: "total", title: "Total", type: "float", required: true},
        {name: "paid", title: "Pago", type: "float", required: true},
        {name: "remaining", title: "Pendiente", type: "float", required: true},
        
        {name: "responsible ", title: "Almacenista responsable", stype: "select", dataSource: "User", required: false},
        {name: "created", title: "Fecha de creación", type: "date", required: false},
        {name: "checkin", title: "Fecha de recepción", type: "date", required: false}
    ]
};

/*
 * ItemOrder
 * Orden de compra. Las órdenes de compra permiten actualizar la existencia de
 * productos en un almacén.
 * @type Transactional
 */
eng.dataSources["ItemOrder"] = {
    scls: "ItemOrder",
    modelid: "SWBF2",
    dataStore: "mongodb",    
    displayField: "name",
    fields: [
        {
            name: "quantity", title: "Cantidad", required: true, type: "int"
            , validators: [
                {type: "integerRange", min: 1, errorMessage: "La cantidad debe ser de al menos 1."}
            ]
        },
        {name: "unit", title: "Unidad", required: true, stype: "select", dataSource: "CFDIU"},
        {
            name: "product", title: "Producto", required: true, stype: "select", dataSource: "Product"
            ,fields: [
                {name: "code"},
                {name: "productName"},
            ]
        },
        {name: "cost", title: "Costo", required: true, type: "float"},
        {name: "iva", title: "IVA", required: true, stype: "select", dataSource: "Tax"},
        
        {name: "created", title: "Fecha de creación", type: "date", required: false}
    ]
};


eng.dataSources["SaleRemission"] = {
    scls: "SaleRemission",
    modelid: "SWBF2",
    dataStore: "mongodb",    
    displayField: "folio",
    fields: [
        {name: "folio", title: "Folio", canEdit:false, required: false, type: "string"},
        {name: "dateSale", title: "Fecha", type: "date"},
        {name: "client", title: "Cliente", type: "string", defaultValue:"Público General"},
        {
        	name: "itemSale", title: "Productos", stype: "grid", 
            showGridSummary:true,
            dataSource:"ItemSale"
        },        
        {name: "subtotal", title: "Subtotal", type: "float", format:"$,##0.00"},
        {name: "iva", title: "Total IVA", format:"$,##0.00", type: "float",
            formula: { text: "total-subtotal" },
            validators_:[{
                type:"serverCustom",                                    //serverCustom del lado del servidor
                serverCondition:function(name,value,request){                    
                    return value>=0;
                },
                errorMessage:"Error. El iva no puede tener un valor negativo."
            }]            
        },
        {name: "total", title: "Total", format:"$,##0.00", type: "float"},
    ]
};

eng.dataSources["ItemSale"] = {
    scls: "ItemSale",
    modelid: "SWBF2",
    dataStore: "mongodb",    
    displayField: "producto",
    fields: [
        {name: "producto", title: "Producto", 
            required: true, 
            stype: "select", 
            dataSource:"Productos",
            changed:function(form,item,value){
                //console.log(form,item,value);
                var record=item.getSelectedRecord(); 
                //console.log(record); 
                if(record) 
                {
                    form.setValue('precio', record.precio);
                    form.setValue('iva', record.iva);
                    form.setValue('cantidad', 1);
                    form.focusInItem("cantidad");
                }
            }
        },
        {name: "cantidad", title: "Cantidad", type: "int"},
        {name: "precio", title: "Precio", showGridSummary:false, type: "float"},
        {name: "subtotal", title: "Subtotal", canEdit:false, 
            type: "float", 
            format:"$,##0.00", 
            formula: { text: "precio*cantidad" },
            getGridSummary:function (records, summaryField) {
                var ret=0;
                //for (var i = 0; i < records.length; i++) {
                //    ret+=records[i].subtotal;
                //}
                if(form)
                {
                    var g=form.getField("productos").grid;
                    var i=0;
                    var d=g.getEditedRecord(i).subtotal;                    
                    while(d!==undefined)
                    {              
                        ret+=d;
                        i++;
                        d=g.getEditedRecord(i).subtotal;
                    }                                        
                    form.setValue("subtotal",ret);
                }
                return ret;
            },             
        },
        {name: "iva", title: "IVA", showGridSummary:false, 
            canEdit:false, 
            type: "float", 
            format:"$,##0.00", 
        },
        {name: "total", title: "Total", canEdit:false, type: "float", 
            format:"$,##0.00", 
            formula: { text: "(iva*precio*cantidad)+precio*cantidad" },
            getGridSummary:function (records, summaryField) {
                var ret=0;
                if(form)
                {
                    var g=form.getField("productos").grid;
                    var i=0;
                    var d=g.getEditedRecord(i).total;                    
                    while(d!==undefined)
                    {              
                        ret+=d;
                        i++;
                        d=g.getEditedRecord(i).total;
                    }                                        
                    form.setValue("total",ret);
                }
                return ret;
            },             
        },
    ]
};




//**************************************************************
//******* Validators *******************************************
//**************************************************************

eng.validators["email"] = {type:"regexp", expression:"^([a-zA-Z0-9_.\\-+])+@(([a-zA-Z0-9\\-])+\\.)+[a-zA-Z0-9]{2,4}$",errorMessage:"No es un correo electrónico válido"};





//**************************************************************
//******* Data Processors **************************************
//**************************************************************

/**
 * dpPurchaseOrder
 * Processor de orden de compra
 * @type dataProcessor
 */
eng.dataProcessors["dpPurchaseOrder"] = {
    dataSources: ["PurchaseOrder"],
    actions: ["add", "update"],
    request: function(request, dataSource, action)
    {
print("\n\n dpPurchaseOrder................");
        var today = getFormatDate();
        if(action==="add")
        {
            request.data.created = today;
            request.data.updated = today;
        }
        else if(action==="update")
        {
            request.data.updated = today;
        }
        return request;
    }
    ,response: function (response, dataSource, action)
    {
        return response;
    }
};

/**
 * dpMerchandiseRcv
 * Processor de recepción de mercancía
 * @type dataProcessor
 */
eng.dataProcessors["dpMerchandiseRcv"] = {
    dataSources: ["MerchandiseRcv"],
    actions: ["add", "update"],
    request: function(request, dataSource, action)
    {
print("\n\n dpMerchandiseRcv................");
print("action="+action);
        var today = getFormatDate();

        if(action==="add")
        {
            request.data.created = today;
            request.data.updated = today;
        }
        else if(action==="update")
        {
            request.data.updated = today;
            if(request.data.status) {
                request.data.responsible = this.user._id;
                for(var i=0; i<request.data.order.size(); i++) {
                    
                }
            }
        }
        return request;
    }
    ,response: function (response, dataSource, action)
    {
        return response;
    }
};




//**************************************************************
//******* Data Services ****************************************
//**************************************************************

/**
 * dsPurchaseOrder
 * Servicio que registra la recepción de mercancía correspondiente a la orden de 
 * compra
 * @type dataService
 */
eng.dataServices["dsPurchaseOrder"] = {
    dataSources: ["PurchaseOrder"],
    actions: ["add", "update"],
    service: function (request, response, dataSource, action)
    {
        if (action==="add")
        {
            var purchaseOrderDS = this.getDataSource(dataSource);
            var merchandiseDS = this.getDataSource("MerchandiseRcv");
            var merchandiseDO;
            var purchaseOrderDO = purchaseOrderDS.fetchObjById(response.data._id);
            if(purchaseOrderDO) {
                merchandiseDO = merchandiseDS.addObj({
                    number: "001111",
                    supplier: purchaseOrderDO.supplier,
                    purchaseOrder: purchaseOrderDO.getId(),
                    order: purchaseOrderDO.order,
                    status: false,
                    subtotal:0.0,
                    discount:0.0,
                    iva:0.0,
                    total:0.0,
                    paid:0.0,
                    remaining:0.0
                });
            }
        }
        else if(action==="update")
        {
            var purchaseOrderDS = this.getDataSource(dataSource);
            var merchandiseDS = this.getDataSource("MerchandiseRcv");
            var merchandiseDO;
            var purchaseOrderDO = purchaseOrderDS.fetchObjById(response.data._id);
            
            var res = merchandiseDS.fetch({data: {purchaseOrder: purchaseOrderDO.getId()}});
            if(res.response.totalRows===1) {
                merchandiseDO = merchandiseDS.fetchObjById(res.response.data[0]._id);
            }
            if(merchandiseDO) {
                merchandiseDO.order = purchaseOrderDO.order;
                merchandiseDS.updateObj(merchandiseDO);
            }
        }
    }
};

/**
 * dsMerchandiseRcv
 * Servicio que actualiza las existencias del inventario una vez surtida la Orden
 * de compra
 * @type dataService
 */
eng.dataServices["dsMerchandiseRcv"] = {
    dataSources: ["MerchandiseRcv"],
    actions: ["update"],
    service: function (request, response, dataSource, action)
    {
        var productDS = this.getDataSource("Product");
        var itemOrderDS = this.getDataSource("ItemOrder");
        
        var prdDO;
        var itemOrderDO;
        if(request.data.status===true && request.oldValues.status===false) {
            for(var i=0; i<request.data.order.size(); i++) {
                itemOrderDO = itemOrderDS.fetchObjById(request.data.order[i]);
                if(itemOrderDO) {
                    prdDO = productDS.fetchObjById(itemOrderDO.product);
                    if(prdDO) {
                        if(itemOrderDO.quantity>0) {
                            prdDO.existence += itemOrderDO.quantity;
                            productDS.updateObj(prdDO);
                        }
                    }
                }
            }
        }
    }
};