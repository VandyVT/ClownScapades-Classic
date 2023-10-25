using System;
using UnityEngine;
using UnityEngine.SceneManagement;

// Token: 0x02000016 RID: 22
public class SecretEnd : MonoBehaviour
{
	// Token: 0x06000056 RID: 86 RVA: 0x000030A8 File Offset: 0x000012A8
	public void source2play()
	{
		SceneManager.LoadScene("MainMenu");
	}

	// Token: 0x06000057 RID: 87 RVA: 0x000030B4 File Offset: 0x000012B4
	private void OnTriggerEnter(Collider other)
	{
		if (other.CompareTag("Player"))
		{
			base.Invoke("source2play", 4f);
			GameObject.Find("Player").GetComponent<AudioSource>().enabled = false;
			this.Fade.SetBool("PlayerSecret", true);
			this.source.PlayOneShot(this.clip);
			this.AmbientAudio.GetComponent<AudioSource>().Stop();
			this.AmbientAudio2.GetComponent<AudioSource>().Stop();
			base.GetComponent<Collider>().isTrigger = false;
			base.GetComponent<BoxCollider>().enabled = false;
		}
	}

	// Token: 0x04000055 RID: 85
	[SerializeField]
	private Animator Fade;

	// Token: 0x04000056 RID: 86
	public AudioSource source;

	// Token: 0x04000057 RID: 87
	public AudioClip clip;

	// Token: 0x04000058 RID: 88
	public GameObject AmbientAudio;

	// Token: 0x04000059 RID: 89
	public GameObject AmbientAudio2;
}
