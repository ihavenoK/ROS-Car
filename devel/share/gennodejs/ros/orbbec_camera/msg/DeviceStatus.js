// Auto-generated. Do not edit!

// (in-package orbbec_camera.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class DeviceStatus {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.color_frame_rate_cur = null;
      this.color_frame_rate_avg = null;
      this.color_frame_rate_min = null;
      this.color_frame_rate_max = null;
      this.color_delay_ms_cur = null;
      this.color_delay_ms_avg = null;
      this.color_delay_ms_min = null;
      this.color_delay_ms_max = null;
      this.depth_frame_rate_cur = null;
      this.depth_frame_rate_avg = null;
      this.depth_frame_rate_min = null;
      this.depth_frame_rate_max = null;
      this.depth_delay_ms_cur = null;
      this.depth_delay_ms_avg = null;
      this.depth_delay_ms_min = null;
      this.depth_delay_ms_max = null;
      this.device_online = null;
      this.connection_type = null;
      this.customer_calibration_ready = null;
      this.calibration_from_factory = null;
      this.calibration_from_launch_param = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('color_frame_rate_cur')) {
        this.color_frame_rate_cur = initObj.color_frame_rate_cur
      }
      else {
        this.color_frame_rate_cur = 0.0;
      }
      if (initObj.hasOwnProperty('color_frame_rate_avg')) {
        this.color_frame_rate_avg = initObj.color_frame_rate_avg
      }
      else {
        this.color_frame_rate_avg = 0.0;
      }
      if (initObj.hasOwnProperty('color_frame_rate_min')) {
        this.color_frame_rate_min = initObj.color_frame_rate_min
      }
      else {
        this.color_frame_rate_min = 0.0;
      }
      if (initObj.hasOwnProperty('color_frame_rate_max')) {
        this.color_frame_rate_max = initObj.color_frame_rate_max
      }
      else {
        this.color_frame_rate_max = 0.0;
      }
      if (initObj.hasOwnProperty('color_delay_ms_cur')) {
        this.color_delay_ms_cur = initObj.color_delay_ms_cur
      }
      else {
        this.color_delay_ms_cur = 0.0;
      }
      if (initObj.hasOwnProperty('color_delay_ms_avg')) {
        this.color_delay_ms_avg = initObj.color_delay_ms_avg
      }
      else {
        this.color_delay_ms_avg = 0.0;
      }
      if (initObj.hasOwnProperty('color_delay_ms_min')) {
        this.color_delay_ms_min = initObj.color_delay_ms_min
      }
      else {
        this.color_delay_ms_min = 0.0;
      }
      if (initObj.hasOwnProperty('color_delay_ms_max')) {
        this.color_delay_ms_max = initObj.color_delay_ms_max
      }
      else {
        this.color_delay_ms_max = 0.0;
      }
      if (initObj.hasOwnProperty('depth_frame_rate_cur')) {
        this.depth_frame_rate_cur = initObj.depth_frame_rate_cur
      }
      else {
        this.depth_frame_rate_cur = 0.0;
      }
      if (initObj.hasOwnProperty('depth_frame_rate_avg')) {
        this.depth_frame_rate_avg = initObj.depth_frame_rate_avg
      }
      else {
        this.depth_frame_rate_avg = 0.0;
      }
      if (initObj.hasOwnProperty('depth_frame_rate_min')) {
        this.depth_frame_rate_min = initObj.depth_frame_rate_min
      }
      else {
        this.depth_frame_rate_min = 0.0;
      }
      if (initObj.hasOwnProperty('depth_frame_rate_max')) {
        this.depth_frame_rate_max = initObj.depth_frame_rate_max
      }
      else {
        this.depth_frame_rate_max = 0.0;
      }
      if (initObj.hasOwnProperty('depth_delay_ms_cur')) {
        this.depth_delay_ms_cur = initObj.depth_delay_ms_cur
      }
      else {
        this.depth_delay_ms_cur = 0.0;
      }
      if (initObj.hasOwnProperty('depth_delay_ms_avg')) {
        this.depth_delay_ms_avg = initObj.depth_delay_ms_avg
      }
      else {
        this.depth_delay_ms_avg = 0.0;
      }
      if (initObj.hasOwnProperty('depth_delay_ms_min')) {
        this.depth_delay_ms_min = initObj.depth_delay_ms_min
      }
      else {
        this.depth_delay_ms_min = 0.0;
      }
      if (initObj.hasOwnProperty('depth_delay_ms_max')) {
        this.depth_delay_ms_max = initObj.depth_delay_ms_max
      }
      else {
        this.depth_delay_ms_max = 0.0;
      }
      if (initObj.hasOwnProperty('device_online')) {
        this.device_online = initObj.device_online
      }
      else {
        this.device_online = false;
      }
      if (initObj.hasOwnProperty('connection_type')) {
        this.connection_type = initObj.connection_type
      }
      else {
        this.connection_type = '';
      }
      if (initObj.hasOwnProperty('customer_calibration_ready')) {
        this.customer_calibration_ready = initObj.customer_calibration_ready
      }
      else {
        this.customer_calibration_ready = false;
      }
      if (initObj.hasOwnProperty('calibration_from_factory')) {
        this.calibration_from_factory = initObj.calibration_from_factory
      }
      else {
        this.calibration_from_factory = false;
      }
      if (initObj.hasOwnProperty('calibration_from_launch_param')) {
        this.calibration_from_launch_param = initObj.calibration_from_launch_param
      }
      else {
        this.calibration_from_launch_param = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DeviceStatus
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [color_frame_rate_cur]
    bufferOffset = _serializer.float64(obj.color_frame_rate_cur, buffer, bufferOffset);
    // Serialize message field [color_frame_rate_avg]
    bufferOffset = _serializer.float64(obj.color_frame_rate_avg, buffer, bufferOffset);
    // Serialize message field [color_frame_rate_min]
    bufferOffset = _serializer.float64(obj.color_frame_rate_min, buffer, bufferOffset);
    // Serialize message field [color_frame_rate_max]
    bufferOffset = _serializer.float64(obj.color_frame_rate_max, buffer, bufferOffset);
    // Serialize message field [color_delay_ms_cur]
    bufferOffset = _serializer.float64(obj.color_delay_ms_cur, buffer, bufferOffset);
    // Serialize message field [color_delay_ms_avg]
    bufferOffset = _serializer.float64(obj.color_delay_ms_avg, buffer, bufferOffset);
    // Serialize message field [color_delay_ms_min]
    bufferOffset = _serializer.float64(obj.color_delay_ms_min, buffer, bufferOffset);
    // Serialize message field [color_delay_ms_max]
    bufferOffset = _serializer.float64(obj.color_delay_ms_max, buffer, bufferOffset);
    // Serialize message field [depth_frame_rate_cur]
    bufferOffset = _serializer.float64(obj.depth_frame_rate_cur, buffer, bufferOffset);
    // Serialize message field [depth_frame_rate_avg]
    bufferOffset = _serializer.float64(obj.depth_frame_rate_avg, buffer, bufferOffset);
    // Serialize message field [depth_frame_rate_min]
    bufferOffset = _serializer.float64(obj.depth_frame_rate_min, buffer, bufferOffset);
    // Serialize message field [depth_frame_rate_max]
    bufferOffset = _serializer.float64(obj.depth_frame_rate_max, buffer, bufferOffset);
    // Serialize message field [depth_delay_ms_cur]
    bufferOffset = _serializer.float64(obj.depth_delay_ms_cur, buffer, bufferOffset);
    // Serialize message field [depth_delay_ms_avg]
    bufferOffset = _serializer.float64(obj.depth_delay_ms_avg, buffer, bufferOffset);
    // Serialize message field [depth_delay_ms_min]
    bufferOffset = _serializer.float64(obj.depth_delay_ms_min, buffer, bufferOffset);
    // Serialize message field [depth_delay_ms_max]
    bufferOffset = _serializer.float64(obj.depth_delay_ms_max, buffer, bufferOffset);
    // Serialize message field [device_online]
    bufferOffset = _serializer.bool(obj.device_online, buffer, bufferOffset);
    // Serialize message field [connection_type]
    bufferOffset = _serializer.string(obj.connection_type, buffer, bufferOffset);
    // Serialize message field [customer_calibration_ready]
    bufferOffset = _serializer.bool(obj.customer_calibration_ready, buffer, bufferOffset);
    // Serialize message field [calibration_from_factory]
    bufferOffset = _serializer.bool(obj.calibration_from_factory, buffer, bufferOffset);
    // Serialize message field [calibration_from_launch_param]
    bufferOffset = _serializer.bool(obj.calibration_from_launch_param, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DeviceStatus
    let len;
    let data = new DeviceStatus(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [color_frame_rate_cur]
    data.color_frame_rate_cur = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [color_frame_rate_avg]
    data.color_frame_rate_avg = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [color_frame_rate_min]
    data.color_frame_rate_min = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [color_frame_rate_max]
    data.color_frame_rate_max = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [color_delay_ms_cur]
    data.color_delay_ms_cur = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [color_delay_ms_avg]
    data.color_delay_ms_avg = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [color_delay_ms_min]
    data.color_delay_ms_min = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [color_delay_ms_max]
    data.color_delay_ms_max = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [depth_frame_rate_cur]
    data.depth_frame_rate_cur = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [depth_frame_rate_avg]
    data.depth_frame_rate_avg = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [depth_frame_rate_min]
    data.depth_frame_rate_min = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [depth_frame_rate_max]
    data.depth_frame_rate_max = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [depth_delay_ms_cur]
    data.depth_delay_ms_cur = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [depth_delay_ms_avg]
    data.depth_delay_ms_avg = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [depth_delay_ms_min]
    data.depth_delay_ms_min = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [depth_delay_ms_max]
    data.depth_delay_ms_max = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [device_online]
    data.device_online = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [connection_type]
    data.connection_type = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [customer_calibration_ready]
    data.customer_calibration_ready = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [calibration_from_factory]
    data.calibration_from_factory = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [calibration_from_launch_param]
    data.calibration_from_launch_param = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += _getByteLength(object.connection_type);
    return length + 136;
  }

  static datatype() {
    // Returns string type for a message object
    return 'orbbec_camera/DeviceStatus';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5cf8d5046efc1ba84cc148313b15c5cc';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
    
    # --- Color stream ---
    float64 color_frame_rate_cur
    float64 color_frame_rate_avg
    float64 color_frame_rate_min
    float64 color_frame_rate_max
    
    float64 color_delay_ms_cur
    float64 color_delay_ms_avg
    float64 color_delay_ms_min
    float64 color_delay_ms_max
    
    # --- Depth stream ---
    float64 depth_frame_rate_cur
    float64 depth_frame_rate_avg
    float64 depth_frame_rate_min
    float64 depth_frame_rate_max
    
    float64 depth_delay_ms_cur
    float64 depth_delay_ms_avg
    float64 depth_delay_ms_min
    float64 depth_delay_ms_max
    
    # --- Device info ---
    bool device_online
    string connection_type   # e.g. "USB2.0", "USB3.0", "GigE"
    
    # --- Calibration status ---
    bool customer_calibration_ready
    bool calibration_from_factory
    bool calibration_from_launch_param
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DeviceStatus(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.color_frame_rate_cur !== undefined) {
      resolved.color_frame_rate_cur = msg.color_frame_rate_cur;
    }
    else {
      resolved.color_frame_rate_cur = 0.0
    }

    if (msg.color_frame_rate_avg !== undefined) {
      resolved.color_frame_rate_avg = msg.color_frame_rate_avg;
    }
    else {
      resolved.color_frame_rate_avg = 0.0
    }

    if (msg.color_frame_rate_min !== undefined) {
      resolved.color_frame_rate_min = msg.color_frame_rate_min;
    }
    else {
      resolved.color_frame_rate_min = 0.0
    }

    if (msg.color_frame_rate_max !== undefined) {
      resolved.color_frame_rate_max = msg.color_frame_rate_max;
    }
    else {
      resolved.color_frame_rate_max = 0.0
    }

    if (msg.color_delay_ms_cur !== undefined) {
      resolved.color_delay_ms_cur = msg.color_delay_ms_cur;
    }
    else {
      resolved.color_delay_ms_cur = 0.0
    }

    if (msg.color_delay_ms_avg !== undefined) {
      resolved.color_delay_ms_avg = msg.color_delay_ms_avg;
    }
    else {
      resolved.color_delay_ms_avg = 0.0
    }

    if (msg.color_delay_ms_min !== undefined) {
      resolved.color_delay_ms_min = msg.color_delay_ms_min;
    }
    else {
      resolved.color_delay_ms_min = 0.0
    }

    if (msg.color_delay_ms_max !== undefined) {
      resolved.color_delay_ms_max = msg.color_delay_ms_max;
    }
    else {
      resolved.color_delay_ms_max = 0.0
    }

    if (msg.depth_frame_rate_cur !== undefined) {
      resolved.depth_frame_rate_cur = msg.depth_frame_rate_cur;
    }
    else {
      resolved.depth_frame_rate_cur = 0.0
    }

    if (msg.depth_frame_rate_avg !== undefined) {
      resolved.depth_frame_rate_avg = msg.depth_frame_rate_avg;
    }
    else {
      resolved.depth_frame_rate_avg = 0.0
    }

    if (msg.depth_frame_rate_min !== undefined) {
      resolved.depth_frame_rate_min = msg.depth_frame_rate_min;
    }
    else {
      resolved.depth_frame_rate_min = 0.0
    }

    if (msg.depth_frame_rate_max !== undefined) {
      resolved.depth_frame_rate_max = msg.depth_frame_rate_max;
    }
    else {
      resolved.depth_frame_rate_max = 0.0
    }

    if (msg.depth_delay_ms_cur !== undefined) {
      resolved.depth_delay_ms_cur = msg.depth_delay_ms_cur;
    }
    else {
      resolved.depth_delay_ms_cur = 0.0
    }

    if (msg.depth_delay_ms_avg !== undefined) {
      resolved.depth_delay_ms_avg = msg.depth_delay_ms_avg;
    }
    else {
      resolved.depth_delay_ms_avg = 0.0
    }

    if (msg.depth_delay_ms_min !== undefined) {
      resolved.depth_delay_ms_min = msg.depth_delay_ms_min;
    }
    else {
      resolved.depth_delay_ms_min = 0.0
    }

    if (msg.depth_delay_ms_max !== undefined) {
      resolved.depth_delay_ms_max = msg.depth_delay_ms_max;
    }
    else {
      resolved.depth_delay_ms_max = 0.0
    }

    if (msg.device_online !== undefined) {
      resolved.device_online = msg.device_online;
    }
    else {
      resolved.device_online = false
    }

    if (msg.connection_type !== undefined) {
      resolved.connection_type = msg.connection_type;
    }
    else {
      resolved.connection_type = ''
    }

    if (msg.customer_calibration_ready !== undefined) {
      resolved.customer_calibration_ready = msg.customer_calibration_ready;
    }
    else {
      resolved.customer_calibration_ready = false
    }

    if (msg.calibration_from_factory !== undefined) {
      resolved.calibration_from_factory = msg.calibration_from_factory;
    }
    else {
      resolved.calibration_from_factory = false
    }

    if (msg.calibration_from_launch_param !== undefined) {
      resolved.calibration_from_launch_param = msg.calibration_from_launch_param;
    }
    else {
      resolved.calibration_from_launch_param = false
    }

    return resolved;
    }
};

module.exports = DeviceStatus;
