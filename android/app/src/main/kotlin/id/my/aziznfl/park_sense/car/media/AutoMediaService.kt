import android.util.Log

object ServiceLogger {
    val messages = mutableListOf<String>()

    fun log(tag: String, msg: String) {
        messages.add("$tag: $msg")
        Log.d(tag, msg) // optional, still logs to logcat
    }
}

class AutoMediaService : MediaBrowserServiceCompat() {

    override fun onCreate() {
        super.onCreate()
        ServiceLogger.log("AutoMediaService", "onCreate called")

        mediaSession = MediaSessionCompat(this, "AutoMediaService")
        mediaSession.isActive = true
        sessionToken = mediaSession.sessionToken
    }

    override fun onGetRoot(
        clientPackageName: String,
        clientUid: Int,
        rootHints: Bundle?
    ): BrowserRoot {
        ServiceLogger.log("AutoMediaService", "onGetRoot called from $clientPackageName")
        return BrowserRoot("root", null)
    }

    override fun onLoadChildren(
        parentId: String,
        result: Result<MutableList<MediaBrowserCompat.MediaItem>>
    ) {
        ServiceLogger.log("AutoMediaService", "onLoadChildren called")
        val item = MediaBrowserCompat.MediaItem(
            MediaDescriptionCompat.Builder()
                .setMediaId("dummy")
                .setTitle("Hello Android Auto")
                .setSubtitle("ParkSense Demo")
                .build(),
            MediaBrowserCompat.MediaItem.FLAG_PLAYABLE
        )
        result.sendResult(mutableListOf(item))
    }
}
