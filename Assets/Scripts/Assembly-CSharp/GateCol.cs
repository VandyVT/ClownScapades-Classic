using System;
using System.Runtime.CompilerServices;
using UnityEngine;

// Token: 0x02000009 RID: 9
public class GateCol : MonoBehaviour
{
	// Token: 0x06000024 RID: 36 RVA: 0x00002863 File Offset: 0x00000A63
	public void source2play()
	{
		base.GetComponent<AudioSource>().Play();
	}

	// Token: 0x06000025 RID: 37 RVA: 0x00002870 File Offset: 0x00000A70
	private void OnTriggerEnter(Collider other)
	{
		if (other.CompareTag("Player"))
		{
			GameObject.Find("EnemyOBJ").GetComponent<EnemyAIScript>().enabled = true;
			this.Gate.SetBool("IsTrue", true);
			Debug.Log("Player Has Entered THe Level");
			this.source.PlayOneShot(this.clip);
			base.Invoke("source2play", 3f);
			base.GetComponent<Collider>().isTrigger = false;
			base.GetComponent<BoxCollider>().enabled = false;
		}
	}

	// Token: 0x04000029 RID: 41
	[SerializeField]
	private Animator Gate;

	// Token: 0x0400002A RID: 42
	public AudioSource source;

	// Token: 0x0400002B RID: 43
	public AudioClip clip;
}
