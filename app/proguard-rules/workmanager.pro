# Sources:
# https://issuetracker.google.com/issues/116296569
# https://android-review.googlesource.com/c/platform/frameworks/support/+/767262
# https://android-review.googlesource.com/c/platform/frameworks/support/+/782087

-keep class * extends androidx.work.Worker
-keep class * extends androidx.work.InputMerger

# Keep all constructors on NonBlockingWorker, Worker (also marked with @Keep)
-keep public class * extends androidx.work.NonBlockingWorker {
    public <init>(...);
}

# Keep all constructors on ListenableWorker, Worker (also marked with @Keep)
-keep public class * extends androidx.work.ListenableWorker {
    public <init>(...);
}

# Worker#internalInit is marked as @Keep
# We need to keep WorkParameters for the method descriptor of internalInit.
-keep class androidx.work.WorkParameters

# Worker#internalInit is marked as @Keep
# We need to keep WorkerParameters for the method descriptor of internalInit.
-keep class androidx.work.WorkerParameters

# We reflectively try and instantiate FirebaseJobScheduler when we find a Firebase dependency
# on the classpath.
-keep class androidx.work.impl.background.firebase.FirebaseJobScheduler
