using System;
using UnityEngine;

// Token: 0x0200000A RID: 10
public class UIButtonFade : MonoBehaviour
{
	// Token: 0x06000028 RID: 40 RVA: 0x000028F3 File Offset: 0x00000AF3
	private void OnTriggerEnter(Collider other)
	{
		if (other.CompareTag("Player"))
		{
			this.Button.SetBool("FadeinButton", true);
		}
	}

	// Token: 0x06000029 RID: 41 RVA: 0x00002913 File Offset: 0x00000B13
	private void Update()
	{
		if (Input.GetKeyDown(this.FKey))
		{
			this.Button.SetBool("FadeoutButton", true);
		}
		if (Input.GetKeyDown(this.ControllerKey))
		{
			this.Button.SetBool("FadeoutButton", true);
		}
	}

	// Token: 0x0400002C RID: 44
	[SerializeField]
	private Animator Button;

	// Token: 0x0400002D RID: 45
	[SerializeField]
	private KeyCode FKey;

	// Token: 0x0400002E RID: 46
	[SerializeField]
	private KeyCode ControllerKey;
}
