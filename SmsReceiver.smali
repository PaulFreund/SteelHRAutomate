.class public Lcom/withings/wiscale2/ans/SmsReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SmsReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 9
    .annotation build Landroid/annotation/TargetApi;
        value = 0x13
    .end annotation

    .prologue
    const/4 v8, 0x1

    const/4 v2, 0x0

    .line 21
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.action.STEELHR"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p2}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v0

    .line 32
    :cond_1
    const-string v1, "on new sms from: %s"

    new-array v3, v8, [Ljava/lang/Object;

    aput-object v0, v3, v2

    invoke-static {p0, v1, v3}, Lcom/withings/c/as;->b(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)V


    .line 33
    invoke-static {p1}, Lcom/withings/wiscale2/ans/a;->a(Landroid/content/Context;)Lcom/withings/wiscale2/ans/a;

    move-result-object v1

    const/4 v2, 0x5

    invoke-virtual {v1, v2, v8, v0}, Lcom/withings/wiscale2/ans/a;->a(IILjava/lang/String;)V

    .line 36
    :cond_2
    return-void
.end method
