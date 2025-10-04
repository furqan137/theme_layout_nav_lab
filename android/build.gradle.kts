// Top-level Gradle build configuration for Flutter Android Project

import org.gradle.api.tasks.Delete
import org.gradle.api.file.Directory

plugins {
    //  Consistent plugin versions with settings.gradle.kts
    id("com.android.application") version "8.7.0" apply false
    id("org.jetbrains.kotlin.android") version "2.0.0" apply false
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// 🔹 Shared build directory (keeps all builds under one folder)
val sharedBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(sharedBuildDir)

subprojects {
    val subprojectBuildDir: Directory = sharedBuildDir.dir(project.name)
    project.layout.buildDirectory.value(subprojectBuildDir)

    // ✅ Automatically apply correct NDK version to all Android modules
    plugins.withId("com.android.application") {
        extensions.configure<com.android.build.gradle.AppExtension>("android") {
            ndkVersion = "27.0.12077973" // ✅ Forces compatible NDK for shared_preferences
        }
    }

    plugins.withId("com.android.library") {
        extensions.configure<com.android.build.gradle.LibraryExtension>("android") {
            ndkVersion = "27.0.12077973"
        }
    }

    // ✅ Ensure app module is evaluated first
    project.evaluationDependsOn(":app")
}

// 🔹 Clean task to remove build directory
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
