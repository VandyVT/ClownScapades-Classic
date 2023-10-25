using System;
using UnityEngine;
using UnityEngine.UI;

// Token: 0x0200000E RID: 14
public class KeyCollectible : MonoBehaviour
{
	// Token: 0x0600003A RID: 58 RVA: 0x00002BDC File Offset: 0x00000DDC
	private void Start()
	{
		this.displayScore.text = "";
	}

	// Token: 0x0600003B RID: 59 RVA: 0x00002BF0 File Offset: 0x00000DF0
	private void Update()
	{
		this.displayScore.text = this.currentScore + " / 7";
		if (this.currentScore > 6)
		{
			this.Door.SetBool("IsOpen", true);
			this.IsOpening = true;
			if (this.IsOpening)
			{
				this.source.PlayOneShot(this.OpenClip);
				this.IsOpening = false;
				base.enabled = false;
			}
		}
	}

	// Token: 0x0600003C RID: 60 RVA: 0x00002C68 File Offset: 0x00000E68
	private void OnTriggerEnter(Collider other)
	{
		if (other.CompareTag("Key"))
		{
			this.source.PlayOneShot(this.clip);
			Debug.Log("PLAYER HAS USED A KEY");
			this.currentScore++;
			this.source.PlayOneShot(this.clip);
		}
	}

	// Token: 0x0400003E RID: 62
	[SerializeField]
	private Animator Door;

	// Token: 0x0400003F RID: 63
	public AudioSource source;

	// Token: 0x04000040 RID: 64
	public AudioClip clip;

	// Token: 0x04000041 RID: 65
	public AudioClip OpenClip;

	// Token: 0x04000042 RID: 66
	public int currentScore;

	// Token: 0x04000043 RID: 67
	public Text displayScore;

	// Token: 0x04000044 RID: 68
	private bool IsOpening;
}
