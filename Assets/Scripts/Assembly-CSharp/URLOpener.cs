using System;
using UnityEngine;

// Token: 0x02000021 RID: 33
public class URLOpener : MonoBehaviour
{
	// Token: 0x06000087 RID: 135 RVA: 0x000038EA File Offset: 0x00001AEA
	public void Open()
	{
		Application.OpenURL(this.Url);
	}

	// Token: 0x04000077 RID: 119
	public string Url;
}
