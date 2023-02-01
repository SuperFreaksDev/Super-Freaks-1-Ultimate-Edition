{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "obj_climb_mesh_path",
  "eventList": [
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":10,"eventType":7,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":12,"eventType":7,"isDnD":false,},
  ],
  "managed": true,
  "overriddenProperties": [],
  "parent": {
    "name": "Common",
    "path": "folders/Objects/Things/Common.yy",
  },
  "parentObjectId": {
    "name": "obj_climb_mesh",
    "path": "objects/obj_climb_mesh/obj_climb_mesh.yy",
  },
  "persistent": false,
  "physicsAngularDamping": 0.1,
  "physicsDensity": 0.5,
  "physicsFriction": 0.2,
  "physicsGroup": 1,
  "physicsKinematic": false,
  "physicsLinearDamping": 0.1,
  "physicsObject": false,
  "physicsRestitution": 0.1,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsShapePoints": [],
  "physicsStartAwake": true,
  "properties": [
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"my_path","filters":[
        "GMPath",
      ],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"0","varType":5,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"path_speed_start","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":true,"rangeMax":16.0,"rangeMin":1.0,"value":"2","varType":1,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"path_end_action","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":true,"rangeMax":1.0,"rangeMin":0.0,"value":"path_action_stop","varType":1,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"already_moving","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"0","varType":3,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"activate_timer","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":true,"rangeMax":120.0,"rangeMin":20.0,"value":"20","varType":1,},
  ],
  "solid": false,
  "spriteId": {
    "name": "spr_climb_mesh",
    "path": "sprites/spr_climb_mesh/spr_climb_mesh.yy",
  },
  "spriteMaskId": null,
  "visible": true,
}