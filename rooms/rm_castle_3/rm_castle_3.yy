{
  "resourceType": "GMRoom",
  "resourceVersion": "1.0",
  "name": "rm_castle_3",
  "creationCodeFile": "${project_dir}/rooms/rm_castle_3/RoomCreationCode.gml",
  "inheritCode": false,
  "inheritCreationOrder": true,
  "inheritLayers": true,
  "instanceCreationOrder": [
    {"name":"inst_49EC6FA7_27","path":"rooms/rm_castle_3/rm_castle_3.yy",},
    {"name":"inst_18FDBC48_2","path":"rooms/rm_castle_3/rm_castle_3.yy",},
    {"name":"inst_76754DA3","path":"rooms/rm_castle_3/rm_castle_3.yy",},
    {"name":"inst_3EA19167","path":"rooms/rm_castle_3/rm_castle_3.yy",},
    {"name":"inst_52322BC4","path":"rooms/rm_castle_3/rm_castle_3.yy",},
  ],
  "isDnd": false,
  "layers": [
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"layer_instances","depth":0,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":8,"hierarchyFrozen":false,"inheritLayerDepth":true,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":false,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_49EC6FA7_27","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":{"name":"inst_49EC6FA7","path":"rooms/rm_level_parent/rm_level_parent.yy",},"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_start_pos","path":"objects/obj_start_pos/obj_start_pos.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":32.0,"y":864.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_18FDBC48_2","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_background_castle","path":"objects/obj_background_castle/obj_background_castle.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":64.0,"y":752.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_76754DA3","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_heavy_door_block","path":"objects/obj_heavy_door_block/obj_heavy_door_block.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_heavy_door_block","path":"objects/obj_heavy_door_block/obj_heavy_door_block.yy",},"propertyId":{"name":"destination_y","path":"objects/obj_heavy_door_block/obj_heavy_door_block.yy",},"value":"862",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.4444444,"x":448.0,"y":752.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_3EA19167","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_mortar","path":"objects/obj_mortar/obj_mortar.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_mortar","path":"objects/obj_mortar/obj_mortar.yy",},"propertyId":{"name":"shoot_frequency","path":"objects/obj_mortar/obj_mortar.yy",},"value":"96",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_level_obj","path":"objects/obj_level_obj/obj_level_obj.yy",},"propertyId":{"name":"difficulty","path":"objects/obj_level_obj/obj_level_obj.yy",},"value":"\"Normal\", \"Hard\"",},
          ],"rotation":0.0,"scaleX":-1.0,"scaleY":1.0,"x":656.0,"y":752.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_52322BC4","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_heavy_door_block","path":"objects/obj_heavy_door_block/obj_heavy_door_block.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_heavy_door_block","path":"objects/obj_heavy_door_block/obj_heavy_door_block.yy",},"propertyId":{"name":"trigger_id","path":"objects/obj_heavy_door_block/obj_heavy_door_block.yy",},"value":"1",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_heavy_door_block","path":"objects/obj_heavy_door_block/obj_heavy_door_block.yy",},"propertyId":{"name":"destination_y","path":"objects/obj_heavy_door_block/obj_heavy_door_block.yy",},"value":"y + 320",},
          ],"rotation":0.0,"scaleX":1.5,"scaleY":2.0,"x":1168.0,"y":892.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"layer_tiles_special","depth":100,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":true,"inheritLayerSettings":true,"inheritSubLayers":true,"inheritVisibility":false,"layers":[],"properties":[],"tiles":{"SerialiseHeight":30,"SerialiseWidth":125,"TileCompressedData":[
-3750,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"tileset_special","path":"tilesets/tileset_special/tileset_special.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"layer_tiles_normal","depth":200,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":true,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":30,"SerialiseWidth":125,"TileCompressedData":[
-46,1,1,16,-26,0,-52,-2147483648,-46,1,1,16,-26,0,-52,-2147483648,-46,1,1,16,-26,0,-52,-2147483648,-46,1,1,16,-26,0,-52,-2147483648,-46,1,1,16,-26,0,-52,-2147483648,-46,1,1,16,-26,0,-52,-2147483648,-46,1,1,16,-26,0,-52,-2147483648,-46,1,1,16,-26,0,-52,-2147483648,-46,1,1,16,-26,0,-52,-2147483648,-46,1,1,16,-26,0,-52,-2147483648,-46,1,1,16,-26,0,-52,-2147483648,-46,1,1,16,-26,0,-52,-2147483648,-46,1,1,16,-26,0,-52,-2147483648,-46,1,1,16,-26,0,-52,-2147483648,-46,1,1,16,-26,0,-52,-2147483648,-46,1,1,16,-26,
0,-52,-2147483648,-46,1,1,16,-26,0,-52,-2147483648,-46,1,1,16,-26,0,-52,-2147483648,-15,1,1,19,-24,13,1,20,-5,1,1,16,-26,0,-52,-2147483648,-15,1,1,16,-24,0,1,15,-5,1,1,16,-26,0,-52,-2147483648,-15,1,1,16,-24,0,1,15,-5,1,1,16,-26,0,-52,-2147483648,-7,13,2,20,19,-6,13,1,14,-24,0,1,15,-5,1,1,16,-26,0,-52,-2147483648,-7,0,2,15,16,-31,0,1,12,-5,13,1,14,-26,0,-52,-2147483648,-7,0,2,15,16,-20,0,4,40,41,41,42,-40,0,-52,-2147483648,-7,0,2,12,
14,-4,0,2,40,42,-4,0,3,40,41,42,-7,0,4,36,37,37,38,-40,0,-52,-2147483648,-13,0,2,3,5,-4,0,3,9,10,11,-11,41,1,42,-5,0,1,40,-8,41,-25,0,-52,-2147483648,-19,0,3,15,1,18,-11,10,1,11,-5,0,1,9,-8,10,1,11,-24,0,-52,-2147483648,-19,41,1,15,-13,1,1,16,-5,0,1,15,-8,1,1,16,-24,0,-52,-2147483648,-19,10,1,17,-13,1,1,16,-5,0,1,15,-8,1,1,16,-24,0,-52,-2147483648,-33,1,1,16,-5,0,1,15,-8,1,1,16,-24,0,-52,
-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"tileset_castle","path":"tilesets/tileset_castle/tileset_castle.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"layer_background","animationFPS":60.0,"animationSpeedType":0,"colour":4278190128,"depth":300,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"hspeed":0.0,"htiled":true,"inheritLayerDepth":true,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"spriteId":null,"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.0,"vtiled":true,"x":0,"y":0,},
  ],
  "parent": {
    "name": "Conveyor Castle",
    "path": "folders/Rooms/Levels/Castle Kranion/Conveyor Castle.yy",
  },
  "parentRoom": {
    "name": "rm_level_parent",
    "path": "rooms/rm_level_parent/rm_level_parent.yy",
  },
  "physicsSettings": {
    "inheritPhysicsSettings": true,
    "PhysicsWorld": false,
    "PhysicsWorldGravityX": 0.0,
    "PhysicsWorldGravityY": 10.0,
    "PhysicsWorldPixToMetres": 0.1,
  },
  "roomSettings": {
    "Height": 960,
    "inheritRoomSettings": false,
    "persistent": false,
    "Width": 4000,
  },
  "sequenceId": null,
  "views": [
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
  ],
  "viewSettings": {
    "clearDisplayBuffer": true,
    "clearViewBackground": false,
    "enableViews": false,
    "inheritViewSettings": true,
  },
  "volume": 1.0,
}