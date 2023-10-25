using System;
using UnityEngine;

// Token: 0x02000024 RID: 36
public class SoulTrigger : MonoBehaviour
{
	// Token: 0x06000092 RID: 146 RVA: 0x00003AD8 File Offset: 0x00001CD8
	private void OnTriggerEnter(Collider other)
	{
		if (other.CompareTag("Player"))
		{
			this.Soul.SetBool("SoulGot", true);
			this.source.PlayOneShot(this.clip);
			Debug.Log("PLAYER HAS COLLECTED A SOUL");
			base.GetComponent<Collider>().isTrigger = false;
			base.GetComponent<BoxCollider>().enabled = false;
		}
	}

	// Token: 0x04000084 RID: 132
	public AudioSource source;

	// Token: 0x04000085 RID: 133
	public AudioClip clip;

	// Token: 0x04000086 RID: 134
	[SerializeField]
	private Animator Soul;
}
