// Autogenerated from Pigeon (v4.2.15), do not edit directly.
// See also: https://pub.dev/packages/pigeon

package com.zero.flutter_pigeon_plugin

import android.util.Log
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MessageCodec
import io.flutter.plugin.common.StandardMessageCodec
import java.io.ByteArrayOutputStream
import java.nio.ByteBuffer

/** Generated class from Pigeon. */

/** Generated class from Pigeon that represents data sent in messages. */
data class SearchRequest (
  val query: String

) {
  companion object {
    @Suppress("UNCHECKED_CAST")
    fun fromList(list: List<Any?>): SearchRequest {
      val query = list[0] as String

      return SearchRequest(query)
    }
  }
  fun toList(): List<Any?> {
    return listOf<Any?>(
      query,
    )
  }
}

/** Generated class from Pigeon that represents data sent in messages. */
data class SearchReply (
  val result: String

) {
  companion object {
    @Suppress("UNCHECKED_CAST")
    fun fromList(list: List<Any?>): SearchReply {
      val result = list[0] as String

      return SearchReply(result)
    }
  }
  fun toList(): List<Any?> {
    return listOf<Any?>(
      result,
    )
  }
}
@Suppress("UNCHECKED_CAST")
private object FlutterCallNativeApiCodec : StandardMessageCodec() {
  override fun readValueOfType(type: Byte, buffer: ByteBuffer): Any? {
    return when (type) {
      128.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          SearchReply.fromList(it)
        }
      }
      129.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          SearchRequest.fromList(it)
        }
      }
      else -> super.readValueOfType(type, buffer)
    }
  }
  override fun writeValue(stream: ByteArrayOutputStream, value: Any?)   {
    when (value) {
      is SearchReply -> {
        stream.write(128)
        writeValue(stream, value.toList())
      }
      is SearchRequest -> {
        stream.write(129)
        writeValue(stream, value.toList())
      }
      else -> super.writeValue(stream, value)
    }
  }
}

/**
 * flutter call native
 *
 * Generated interface from Pigeon that represents a handler of messages from Flutter.
 */
interface FlutterCallNativeApi {
  fun search(request: SearchRequest): SearchReply

  companion object {
    /** The codec used by FlutterCallNativeApi. */
    val codec: MessageCodec<Any?> by lazy {
      FlutterCallNativeApiCodec
    }
    /** Sets up an instance of `FlutterCallNativeApi` to handle messages through the `binaryMessenger`. */
    @Suppress("UNCHECKED_CAST")
    fun setUp(binaryMessenger: BinaryMessenger, api: FlutterCallNativeApi?) {
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.FlutterCallNativeApi.search", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            var wrapped = listOf<Any?>()
            try {
              val args = message as List<Any?>
              val requestArg = args[0] as SearchRequest
              wrapped = listOf<Any?>(api.search(requestArg))
            } catch (exception: Error) {
              wrapped = wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
    }
  }
}
@Suppress("UNCHECKED_CAST")
private object NativeCallFlutterApiCodec : StandardMessageCodec() {
  override fun readValueOfType(type: Byte, buffer: ByteBuffer): Any? {
    return when (type) {
      128.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          SearchReply.fromList(it)
        }
      }
      129.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          SearchRequest.fromList(it)
        }
      }
      else -> super.readValueOfType(type, buffer)
    }
  }
  override fun writeValue(stream: ByteArrayOutputStream, value: Any?)   {
    when (value) {
      is SearchReply -> {
        stream.write(128)
        writeValue(stream, value.toList())
      }
      is SearchRequest -> {
        stream.write(129)
        writeValue(stream, value.toList())
      }
      else -> super.writeValue(stream, value)
    }
  }
}

/**
 * native call flutter
 *
 * Generated class from Pigeon that represents Flutter messages that can be called from Kotlin.
 */
@Suppress("UNCHECKED_CAST")
class NativeCallFlutterApi(private val binaryMessenger: BinaryMessenger) {
  companion object {
    /** The codec used by NativeCallFlutterApi. */
    val codec: MessageCodec<Any?> by lazy {
      NativeCallFlutterApiCodec
    }
  }
  fun query(requestArg: SearchRequest, callback: (SearchReply) -> Unit) {
    val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.NativeCallFlutterApi.query", codec)
    channel.send(listOf(requestArg)) {
      val result = it as SearchReply
      callback(result)
    }
  }
}

private fun wrapResult(result: Any?): List<Any?> {
  return listOf(result)
}

private fun wrapError(exception: Throwable): List<Any> {
  return listOf<Any>(
    exception.javaClass.simpleName,
    exception.toString(),
    "Cause: " + exception.cause + ", Stacktrace: " + Log.getStackTraceString(exception)
  )
}