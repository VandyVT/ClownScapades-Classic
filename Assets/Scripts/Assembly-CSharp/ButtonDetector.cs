using System;
using UnityEngine;

// Token: 0x0200000B RID: 11
public class ButtonDetector : MonoBehaviour
{
	// Token: 0x0600002B RID: 43 RVA: 0x00002954 File Offset: 0x00000B54
	private void OnTriggerEnter(Collider other)
	{
		if (other.CompareTag("Box For Button"))
		{
			this.Cage.SetBool("IsOpen", true);
			this.Button.SetBool("IsBoxed", true);
			this.source.PlayOneShot(this.ChainSound);
			this.ButtonSource.PlayOneShot(this.ButtonSound);
		}
	}

	// Token: 0x0600002C RID: 44 RVA: 0x000029B4 File Offset: 0x00000BB4
	private void OnTriggerExit(Collider other)
	{
		if (other.CompareTag("Box For Button"))
		{
			this.Cage.SetBool("IsOpen", false);
			this.Button.SetBool("IsBoxed", false);
			this.source.PlayOneShot(this.clip);
			this.ButtonSource.PlayOneShot(this.ButtonSound2);
		}
	}

	// Token: 0x0400002F RID: 47
	[SerializeField]
	private Animator Cage;

	// Token: 0x04000030 RID: 48
	[SerializeField]
	private Animator Button;

	// Token: 0x04000031 RID: 49
	public AudioSource source;

	// Token: 0x04000032 RID: 50
	public AudioClip clip;

	// Token: 0x04000033 RID: 51
	public AudioClip ChainSound;

	// Token: 0x04000034 RID: 52
	public AudioSource ButtonSource;

	// Token: 0x04000035 RID: 53
	public AudioClip ButtonSound;

	// Token: 0x04000036 RID: 54
	public AudioClip ButtonSound2;
}
