using System;
using UnityEngine;

// Token: 0x0200002D RID: 45
public class PlayerSteps : MonoBehaviour
{
	// Token: 0x060000BE RID: 190 RVA: 0x00004516 File Offset: 0x00002716
	private void Start()
	{
		this.cc = base.GetComponent<CharacterController>();
	}

	// Token: 0x060000BF RID: 191 RVA: 0x00004524 File Offset: 0x00002724
	private void Update()
	{
		if (this.cc.isGrounded && this.cc.velocity.magnitude > 2f && !base.GetComponent<AudioSource>().isPlaying)
		{
			base.GetComponent<AudioSource>().Play();
		}
	}

	// Token: 0x040000B3 RID: 179
	private CharacterController cc;
}
