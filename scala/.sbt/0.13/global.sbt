cancelable in Global := true

libraryDependencies += "com.lihaoyi" % "ammonite" % "0.8.0" % "test" cross CrossVersion.full

initialCommands in (Test, console) := """ammonite.Main().run()"""

import org.ensime.EnsimeCoursierKeys._
ensimeServerVersion in ThisBuild := "2.0.0-SNAPSHOT"
