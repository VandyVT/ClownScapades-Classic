using System;
using UnityEngine;

// Token: 0x02000012 RID: 18
public class PinkKeyCol : MonoBehaviour
{
	// Token: 0x0600004B RID: 75 RVA: 0x00002E44 File Offset: 0x00001044
	private void OnTriggerEnter(Collider other)
	{
		if (other.CompareTag("Key"))
		{
			this.source.PlayOneShot(this.clip);
			Debug.Log("PLAYER HAS USED A KEY");
			this.source.PlayOneShot(this.clip);
			this.DeleteKey.SetActive(false);
			this.GiveKey.SetActive(true);
		}
	}

	// Token: 0x0400004D RID: 77
	public GameObject DeleteKey;

	// Token: 0x0400004E RID: 78
	public GameObject GiveKey;

	// Token: 0x0400004F RID: 79
	public AudioSource source;

	// Token: 0x04000050 RID: 80
	public AudioClip clip;
}
