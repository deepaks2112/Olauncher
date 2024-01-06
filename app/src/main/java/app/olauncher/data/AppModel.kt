package app.olauncher.data

import android.os.UserHandle
import java.text.CollationKey

data class AppModel(
    val appLabel: String,
    val key: CollationKey?,
    val appPackage: String,
    val activityClassName: String?,
    val user: UserHandle,
) : Comparable<AppModel> {
    override fun compareTo(other: AppModel): Int = when {
        key != null && other.key != null -> key.compareTo(other.key)
        else -> appLabel.compareTo(other.appLabel, true)
    }

    fun toHashMap(): HashMap<String, String?> {
        val map = HashMap<String, String?>()
        map["appLabel"] = appLabel
        map["key"] = key?.sourceString
        map["appPackage"] = appPackage
        map["activityClassName"] = activityClassName
        map["user"] = user.toString()
        return map
    }
}