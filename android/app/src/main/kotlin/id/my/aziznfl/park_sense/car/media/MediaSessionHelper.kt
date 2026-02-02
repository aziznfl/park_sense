package id.my.aziznfl.park_sense.car.media

import android.content.Context
import android.support.v4.media.session.MediaSessionCompat

    object MediaSessionHelper {
    fun createSession(context: Context): MediaSessionCompat {
        val session = MediaSessionCompat(context, "AutoSession")
        session.isActive = true
        return session
    }
}
