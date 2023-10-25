using System;
using UnityEngine;
using UnityEngine.SceneManagement;

// Token: 0x02000017 RID: 23
public class DeathTrigger : MonoBehaviour
{
	// Token: 0x06000059 RID: 89 RVA: 0x0000314D File Offset: 0x0000134D
	private void Start()
	{
		this.deathZone = base.GetComponent<CapsuleCollider>();
	}

	// Token: 0x0600005A RID: 90 RVA: 0x0000315C File Offset: 0x0000135C
	private void OnTriggerEnter(Collider other)
	{
		if (other.CompareTag("Player"))
		{
			this.deathZone.radius += 10f;
			GameObject.Find("Player").GetComponent<AudioSource>().enabled = false;
			GameObject.Find("EnemyOBJ").GetComponent<EnemyAIScript>().enabled = true;
			base.Invoke("ResetGame", 3.5f);
			this.BlackFadeCanvas.SetBool("PlayerDead", true);
			this.source.PlayOneShot(this.clip);
			Debug.Log("Player Has Been Killed");
		}
	}

	// Token: 0x0600005B RID: 91 RVA: 0x000031F4 File Offset: 0x000013F4
	private void OnTriggerStay(Collider other)
	{
		if (other.CompareTag("Player"))
		{
			this.GateTrigger.GetComponent<AudioSource>().Stop();
			this.MusicZone.GetComponent<AudioSource>().Stop();
			this.AmbientAudio.GetComponent<AudioSource>().Stop();
			GameObject.Find("EnemyStep").GetComponent<AudioSource>().Stop();
			GameObject.Find("EnemyFastStep").GetComponent<AudioSource>().Stop();
		}
	}

	// Token: 0x0600005C RID: 92 RVA: 0x00003268 File Offset: 0x00001468
	public void ResetGame()
	{
		SceneManager.LoadScene(SceneManager.GetActiveScene().name);
	}

	// Token: 0x0400005A RID: 90
	[SerializeField]
	private Animator BlackFadeCanvas;

	// Token: 0x0400005B RID: 91
	public AudioSource source;

	// Token: 0x0400005C RID: 92
	public AudioClip clip;

	// Token: 0x0400005D RID: 93
	public GameObject GateTrigger;

	// Token: 0x0400005E RID: 94
	public GameObject MusicZone;

	// Token: 0x0400005F RID: 95
	public GameObject AmbientAudio;

	// Token: 0x04000060 RID: 96
	private CapsuleCollider deathZone;
}
