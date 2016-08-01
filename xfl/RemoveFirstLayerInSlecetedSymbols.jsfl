
var selItems = fl.getDocumentDOM().library.getSelectedItems();

for (var i = 0; i < selItems.length; i++)
{
    fl.getDocumentDOM().library.editItem(selItems[i].name);
    var tl = fl.getDocumentDOM().getTimeline();
    tl.deleteLayer(0);
}
