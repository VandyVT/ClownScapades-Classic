using System;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

// Token: 0x02000023 RID: 35
public class Score : MonoBehaviour
{
	// Token: 0x0600008D RID: 141 RVA: 0x000039CF File Offset: 0x00001BCF
	public void WinGame()
	{
		SceneManager.LoadScene("EndingScene");
	}

	// Token: 0x0600008E RID: 142 RVA: 0x000039DB File Offset: 0x00001BDB
	private void Start()
	{
		this.displayScore.text = "";
	}

	// Token: 0x0600008F RID: 143 RVA: 0x000039F0 File Offset: 0x00001BF0
	private void Update()
	{
		this.displayScore.text = this.currentScore + " / 12";
		if (this.currentScore > 11)
		{
			base.Invoke("WinGame", 3f);
			GameObject.Find("Player").GetComponent<AudioSource>().enabled = false;
			this.GateTrigger.GetComponent<AudioSource>().Stop();
			this.MusicZone.GetComponent<AudioSource>().Stop();
			this.AmbientAudio.GetComponent<AudioSource>().Stop();
			GameObject.Find("EnemyStep").GetComponent<AudioSource>().Stop();
			GameObject.Find("EnemyFastStep").GetComponent<AudioSource>().Stop();
			this.BlackFadeCanvas.SetBool("PlayerDead", true);
		}
	}

	// Token: 0x06000090 RID: 144 RVA: 0x00003AB8 File Offset: 0x00001CB8
	private void OnTriggerEnter(Collider other)
	{
		if (other.CompareTag("SoulZone"))
		{
			this.currentScore++;
		}
	}

	// Token: 0x0400007E RID: 126
	[SerializeField]
	private Animator BlackFadeCanvas;

	// Token: 0x0400007F RID: 127
	public int currentScore;

	// Token: 0x04000080 RID: 128
	public Text displayScore;

	// Token: 0x04000081 RID: 129
	public GameObject GateTrigger;

	// Token: 0x04000082 RID: 130
	public GameObject MusicZone;

	// Token: 0x04000083 RID: 131
	public GameObject AmbientAudio;
}
