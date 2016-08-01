//
// RoundCornersCommand
//
// This command was recorded by Adobe Flash Professional.
//

var iconRadius = 4;
var iconScale = 1 / 6;
var bigRadius = Math.round(iconRadius * (1 / iconScale));

var mainTL = fl.getDocumentDOM().getTimeline();
mainTL.copyLayers(0);
var selItems = fl.getDocumentDOM().library.getSelectedItems();
for (var i = 0; i < selItems.length; i++)
{

    fl.getDocumentDOM().library.editItem(selItems[i].name);
    var tl = fl.getDocumentDOM().getTimeline();
    tl.addNewLayer("RoundedMask", "mask");
    layers = tl.layers;
    maskLayer = layers[0];
    flagLayer = layers[1];
    flagLayer.parentLayer = maskLayer;
    flagImage = flagLayer.frames[0].elements[0];
    var roundRectWidth = flagImage.width;
    var roundRectHeight = flagImage.height;
    tl.setSelectedFrames(0, 0, true);
    fl.getDocumentDOM().addNewPrimitiveRectangle({left:0, top:0, right:roundRectWidth, bottom:roundRectHeight}, bigRadius);
    tl.setSelectedFrames(0, 0, true);
    fl.getDocumentDOM().setStrokeColor('#00000000');
    fl.getDocumentDOM().setFillColor('#990000');
    fl.getDocumentDOM().setStrokeSize(0);

    tl.addNewLayer("border", "normal");
    tl.setSelectedFrames(0, 0, true);
    fl.getDocumentDOM().addNewPrimitiveRectangle({left:0, top:0, right:roundRectWidth, bottom:roundRectHeight}, bigRadius);
    tl.setSelectedFrames(0, 0, true);
    fl.getDocumentDOM().setStrokeColor('#cccccc');
    fl.getDocumentDOM().setFillColor('#00000000');
    fl.getDocumentDOM().setStrokeSize(6);
}


/*
for (var i = 0; i < selItems.length; i++)
{
    fl.getDocumentDOM().library.editItem(selItems[i].name);
    var tl = fl.getDocumentDOM().getTimeline();
    tl.deleteLayer(0);
}*/
/*
fl.getDocumentDOM().library.editItem(selItems[i].name);
var tl = fl.getDocumentDOM().getTimeline();
tl.addNewLayer("RoundedMask")
//tl.addNewLayer("maskLayer", "mask");
tl.pasteLayers(0);
tl.setSelectedLayers(0);
layers = tl.layers;
maskLayer = layers[0];
maskLayer.layerType = "mask";
maskFrame = maskLayer.frames[0];
flagLayer = layers[1];
flagLayer.parentLayer = maskLayer;
flagImage = flagLayer.frames[0].elements[0];
rectObj = maskFrame.elements[0];
rectObj.width = flagImage.width;
rectObj.height = flagImage.height;
rectObj.x = 0;
rectObj.y = 0;*/