using System;
using System.Runtime.CompilerServices;
using UnityEngine;

// Token: 0x0200000F RID: 15
public class LightCol : MonoBehaviour
{
	// Token: 0x0600003E RID: 62 RVA: 0x00002863 File Offset: 0x00000A63
	public void source2play()
	{
		base.GetComponent<AudioSource>().Play();
	}

	// Token: 0x0600003F RID: 63 RVA: 0x00002CBC File Offset: 0x00000EBC
	public void source2play2()
	{
		GameObject.Find("EntrySfx").GetComponent<AudioSource>().Play();
	}

	// Token: 0x06000040 RID: 64 RVA: 0x00002CD4 File Offset: 0x00000ED4
	private void OnTriggerEnter(Collider other)
	{
		if (other.CompareTag("Player"))
		{
			GameObject.Find("EnemyOBJ").GetComponent<EnemyWander>().enabled = true;
			GameObject.Find("AmbientAudio").GetComponent<AudioSource>().Stop();
			GameObject[] array = GameObject.FindGameObjectsWithTag("C2Light");
			for (int i = 0; i < array.Length; i++)
			{
				array[i].SetActive(false);
			}
			this.source2play2();
			Debug.Log("Player Has Entered THe Level");
			this.source.PlayOneShot(this.clip);
			base.Invoke("source2play", 3f);
			base.GetComponent<Collider>().isTrigger = false;
			base.GetComponent<BoxCollider>().enabled = false;
		}
	}

	// Token: 0x04000045 RID: 69
	public AudioSource source;

	// Token: 0x04000046 RID: 70
	public AudioClip clip;
}
