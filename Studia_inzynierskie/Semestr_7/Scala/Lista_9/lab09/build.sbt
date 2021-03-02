import Dependencies._

ThisBuild / scalaVersion     := "2.12.6"
ThisBuild / version          := "0.1.0-SNAPSHOT"
ThisBuild / organization     := "com.example"
ThisBuild / organizationName := "example"

scalacOptions ++= Seq(
  "-Xfatal-warnings"
)

lazy val root = (project in file("."))
  .dependsOn(core)
  .dependsOn(blackjack)
  .settings(
    name := "lab09",
    libraryDependencies += scalaTest % Test
  )

lazy val core = (project in file("./core"))
  .settings(
    name := "core"
  )

lazy val blackjack = (project in file("./blackjack"))
  .dependsOn(core)
  .settings(
    name := "blackjack"
  )

// See https://www.scala-sbt.org/1.x/docs/Using-Sonatype.html for instructions on how to publish to Sonatype.
