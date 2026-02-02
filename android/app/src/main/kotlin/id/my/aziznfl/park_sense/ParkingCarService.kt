//package id.my.aziznfl.park_sense
//
//import android.content.Context
//import android.content.Intent
//import androidx.car.app.CarAppService
//import androidx.car.app.CarContext
//import androidx.car.app.Screen
//import androidx.car.app.Session
//import androidx.car.app.model.Pane
//import androidx.car.app.model.PaneTemplate
//import androidx.car.app.model.Row
//import androidx.car.app.model.Template
//import androidx.car.app.validation.HostValidator
//
//class ParkingCarService : CarAppService() {
//    override fun onCreateSession(): Session {
//        return object : Session() {
//            override fun onCreateScreen(intent: Intent): Screen {
//                return ParkingScreen(carContext)
//            }
//        }
//    }
//
//    override fun createHostValidator(): HostValidator {
//        return HostValidator.ALLOW_ALL_HOSTS_VALIDATOR
//    }
//}
//
//class ParkingScreen(carContext: CarContext) : Screen(carContext) {
//    override fun onGetTemplate(): Template {
//        val prefs = carContext
//            .getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)
//
//        val enterTime = prefs.getLong("flutter.parking_enter_time", -1L)
//
//        val text = if (enterTime > 0) {
//            val diff = System.currentTimeMillis() - enterTime
//            val hours = diff / (1000 * 60 * 60)
//            val minutes = (diff / (1000 * 60)) % 60
//            "${hours}h ${minutes}m"
//        } else {
//            "Not parked"
//        }
//
//        return PaneTemplate.Builder(
//            Pane.Builder()
//                .addRow(
//                    Row.Builder()
//                        .setTitle("Parked Time")
//                        .addText(text)
//                        .build()
//                )
//                .build()
//        )
//            .setTitle("ParkSense")
//            .build()
//    }
//}