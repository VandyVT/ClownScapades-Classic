using System;
using UnityEngine;

// Token: 0x02000010 RID: 16
public class MazeCon : MonoBehaviour
{
	// Token: 0x06000043 RID: 67 RVA: 0x00002D85 File Offset: 0x00000F85
	private void OnTriggerEnter(Collider other)
	{
		if (other.CompareTag("Box For Button"))
		{
			this.Cage.SetBool("IsOpen", true);
		}
	}

	// Token: 0x06000044 RID: 68 RVA: 0x00002DA5 File Offset: 0x00000FA5
	private void OnTriggerExit(Collider other)
	{
		if (other.CompareTag("Box For Button"))
		{
			this.Cage.SetBool("IsOpen", false);
		}
	}

	// Token: 0x04000047 RID: 71
	[SerializeField]
	private Animator Cage;
}
