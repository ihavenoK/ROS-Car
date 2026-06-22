// Auto-generated. Do not edit!

// (in-package orbbec_camera.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class SetFilterRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.filter_name = null;
      this.filter_enable = null;
      this.filter_param = null;
    }
    else {
      if (initObj.hasOwnProperty('filter_name')) {
        this.filter_name = initObj.filter_name
      }
      else {
        this.filter_name = '';
      }
      if (initObj.hasOwnProperty('filter_enable')) {
        this.filter_enable = initObj.filter_enable
      }
      else {
        this.filter_enable = false;
      }
      if (initObj.hasOwnProperty('filter_param')) {
        this.filter_param = initObj.filter_param
      }
      else {
        this.filter_param = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetFilterRequest
    // Serialize message field [filter_name]
    bufferOffset = _serializer.string(obj.filter_name, buffer, bufferOffset);
    // Serialize message field [filter_enable]
    bufferOffset = _serializer.bool(obj.filter_enable, buffer, bufferOffset);
    // Serialize message field [filter_param]
    bufferOffset = _arraySerializer.float32(obj.filter_param, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetFilterRequest
    let len;
    let data = new SetFilterRequest(null);
    // Deserialize message field [filter_name]
    data.filter_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [filter_enable]
    data.filter_enable = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [filter_param]
    data.filter_param = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.filter_name);
    length += 4 * object.filter_param.length;
    return length + 9;
  }

  static datatype() {
    // Returns string type for a service object
    return 'orbbec_camera/SetFilterRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'af08a15d0d0ce8eb893e0f04f525118b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string filter_name
    bool filter_enable
    float32[] filter_param
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetFilterRequest(null);
    if (msg.filter_name !== undefined) {
      resolved.filter_name = msg.filter_name;
    }
    else {
      resolved.filter_name = ''
    }

    if (msg.filter_enable !== undefined) {
      resolved.filter_enable = msg.filter_enable;
    }
    else {
      resolved.filter_enable = false
    }

    if (msg.filter_param !== undefined) {
      resolved.filter_param = msg.filter_param;
    }
    else {
      resolved.filter_param = []
    }

    return resolved;
    }
};

class SetFilterResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
      this.message = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
      if (initObj.hasOwnProperty('message')) {
        this.message = initObj.message
      }
      else {
        this.message = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetFilterResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [message]
    bufferOffset = _serializer.string(obj.message, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetFilterResponse
    let len;
    let data = new SetFilterResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [message]
    data.message = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.message);
    return length + 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'orbbec_camera/SetFilterResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '937c9679a518e3a18d831e57125ea522';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    string message
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetFilterResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    if (msg.message !== undefined) {
      resolved.message = msg.message;
    }
    else {
      resolved.message = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: SetFilterRequest,
  Response: SetFilterResponse,
  md5sum() { return '037b7c075b0fb69f649f20b878a7ce51'; },
  datatype() { return 'orbbec_camera/SetFilter'; }
};
