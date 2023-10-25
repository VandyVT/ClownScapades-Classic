using System;
using UnityEngine;
using UnityEngine.SceneManagement;

// Token: 0x0200000C RID: 12
public class EndTrigger : MonoBehaviour
{
	// Token: 0x0600002E RID: 46 RVA: 0x00002A14 File Offset: 0x00000C14
	private void OnTriggerEnter(Collider other)
	{
		if (other.CompareTag("Player"))
		{
			base.Invoke("WinGame", 3f);
			GameObject.Find("Player").GetComponent<AudioSource>().enabled = false;
			this.GateTrigger.GetComponent<AudioSource>().Play();
			this.GateTrigger2.GetComponent<AudioSource>().Play();
			this.MusicZone.GetComponent<AudioSource>().Stop();
			this.MusicZone2.GetComponent<AudioSource>().Stop();
			this.AmbientAudio.GetComponent<AudioSource>().Stop();
			GameObject.Find("EnemyStep").GetComponent<AudioSource>().Stop();
			GameObject.Find("EnemyFastStep").GetComponent<AudioSource>().Stop();
			this.BlackFadeCanvas.SetBool("PlayerDead", true);
		}
	}

	// Token: 0x0600002F RID: 47 RVA: 0x00002188 File Offset: 0x00000388
	private void Update()
	{
	}

	// Token: 0x06000030 RID: 48 RVA: 0x00002ADF File Offset: 0x00000CDF
	public void WinGame()
	{
		SceneManager.LoadScene("EndingCh2");
	}

	// Token: 0x04000037 RID: 55
	[SerializeField]
	private Animator BlackFadeCanvas;

	// Token: 0x04000038 RID: 56
	public GameObject GateTrigger;

	// Token: 0x04000039 RID: 57
	public GameObject GateTrigger2;

	// Token: 0x0400003A RID: 58
	public GameObject MusicZone;

	// Token: 0x0400003B RID: 59
	public GameObject MusicZone2;

	// Token: 0x0400003C RID: 60
	public GameObject AmbientAudio;
}
