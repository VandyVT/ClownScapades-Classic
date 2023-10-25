using System;
using UnityEngine;

// Token: 0x0200000D RID: 13
public class EndingSfx : MonoBehaviour
{
	// Token: 0x06000032 RID: 50 RVA: 0x00002AEC File Offset: 0x00000CEC
	private void Start()
	{
		base.Invoke("Door", 6f);
		base.Invoke("Music", 0.02f);
		GameObject.Find("SlowWalkSfx").GetComponent<AudioSource>().Play();
		base.Invoke("SlowSfxStop", 7.5f);
		base.Invoke("Elevator", 14.14f);
	}

	// Token: 0x06000033 RID: 51 RVA: 0x00002188 File Offset: 0x00000388
	private void Update()
	{
	}

	// Token: 0x06000034 RID: 52 RVA: 0x00002B4D File Offset: 0x00000D4D
	private void Door()
	{
		GameObject.Find("LockSFX").GetComponent<AudioSource>().Play();
		this.DoorAnim.SetBool("IsTime", true);
	}

	// Token: 0x06000035 RID: 53 RVA: 0x00002B74 File Offset: 0x00000D74
	private void SlowSfxStop()
	{
		GameObject.Find("SlowWalkSfx").GetComponent<AudioSource>().Stop();
		base.Invoke("FastSfx", 2f);
	}

	// Token: 0x06000036 RID: 54 RVA: 0x00002B9A File Offset: 0x00000D9A
	private void FastSfx()
	{
		GameObject.Find("FastWalkSfx").GetComponent<AudioSource>().Play();
	}

	// Token: 0x06000037 RID: 55 RVA: 0x00002BB0 File Offset: 0x00000DB0
	private void Elevator()
	{
		GameObject.Find("ElevatorDing").GetComponent<AudioSource>().Play();
	}

	// Token: 0x06000038 RID: 56 RVA: 0x00002BC6 File Offset: 0x00000DC6
	private void Music()
	{
		GameObject.Find("EndMusic").GetComponent<AudioSource>().Play();
	}

	// Token: 0x0400003D RID: 61
	[SerializeField]
	private Animator DoorAnim;
}
