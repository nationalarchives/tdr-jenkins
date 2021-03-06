import Dependencies._

ThisBuild / scalaVersion     := "2.13.3"
ThisBuild / version          := "0.1.0-SNAPSHOT"
ThisBuild / organization     := "com.example"
ThisBuild / organizationName := "example"

lazy val root = (project in file("."))
  .settings(
    name := "plugin-updates",
    packageName in Universal := "tdr-plugin-updates",
    libraryDependencies ++= Seq(
      catsEffect,
      circeGeneric,
      circeGenericExtras,
      sttp,
      sttpCirce,
      typesafeConfig,
      scalaTest % Test,
      wiremock % Test
    ),
  ).enablePlugins(JavaAppPackaging, UniversalPlugin)
